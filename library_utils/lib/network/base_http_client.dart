import 'dart:io';

import 'package:dio/dio.dart';
import 'package:library_utils/network/interceptor/network_interceptor.dart';

import 'default_http_client_adapter.dart';

typedef ErrorMessageTransform = String Function(int type, String message);
typedef RequestHandle<R> = Future<R> Function(R r);
typedef ResponseHandle<P> = Future<P> Function(P p);

const kDefaultConnectTimeout = 15000;
const kDefaultSendTimeout = 15000;
const kDefaultReadTimeout = 15000;

abstract class BaseHttpClient {
  set errorMessageTransform(String transform(int type, String message)) {}

  void addCommonHeaders(Map<String, dynamic> commonHeaders);

  ///dio拦截器
  void addInterceptor(Interceptor interceptor);

  void removeInterceptor(Interceptor interceptor);

  void addNetInterceptor(NetWorkInterceptor netWorkInterceptor);

  void initHttpClientAdapter(
    Dio dio,
    String baseUrl,
    String proxy,
    List<String> backUpDomainList,
  ) {
    dio.httpClientAdapter = createAdapter();
    if (dio.httpClientAdapter is DefaultHttpClientAdapter) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        if (proxy != null && proxy.length > 0) {
          client.findProxy = (uri) {
            return proxy;
          };
        }
        client.idleTimeout = Duration(seconds: 30);
        client.badCertificateCallback = (X509Certificate cert, String host, int port) {
          return backUpDomainList.contains(host) || baseUrl.contains(host);
        };
      };
    }
  }
}
