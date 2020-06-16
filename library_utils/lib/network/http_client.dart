import 'dart:io';

import 'package:dio/dio.dart';
import 'package:library_utils/network/base_http_client.dart';
import 'package:library_utils/network/interceptor/network_interceptor.dart';

import 'bae_http_model.dart';

class DefaultHttpClient extends BaseHttpClient {
  Dio _dio;

  Dio get dio => _dio;

  bool _debuggable = false;

  List<NetWorkInterceptor> _netWorkInterceptor = [];

  DefaultHttpClient({
    String baseUrl,
    int connectTimeout = kDefaultConnectTimeout,
    int sendTimeout = kDefaultSendTimeout,
    int receiveTimeout = kDefaultReadTimeout,
    String proxy,
    bool debuggable,
    List<String> backUpDomainList = const [],
  }) {
    assert(baseUrl != null);
    assert(Uri.parse(baseUrl) != null && Uri.parse(baseUrl).scheme.startsWith('http'));
    if (proxy != null) {
      assert(proxy.startsWith('PROXY'));
    }
    _debuggable = debuggable;
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    ));
    initHttpClientAdapter(dio, baseUrl, proxy, backUpDomainList);
  }

  @override
  void addCommonHeaders(Map<String, dynamic> commonHeaders) {
    assert(commonHeaders != null);
    _dio.options.headers = {
      ..._dio.options.headers,
      ...commonHeaders,
    };
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    assert(interceptor != null);
    if (!_dio.interceptors.contains(interceptor)) {
      _dio.interceptors.add(interceptor);
    }
  }

  @override
  void addNetInterceptor(NetWorkInterceptor interceptor) {
    assert(interceptor != null);
    if (!_netWorkInterceptor.contains(interceptor)) {
      _netWorkInterceptor.add(interceptor);
    }
  }

  @override
  void removeInterceptor(Interceptor interceptor) {
    assert(interceptor != null);
    if (_dio.interceptors.contains(interceptor)) {
      _dio.interceptors.remove(interceptor);
    }
  }

  Future<BResponse<T>> post<T extends BaseResponse>(
    String path,
    BaseRequest req,
    T result, {
    CancelToken cancelToken,
  }) async {
    assert(_dio.options.baseUrl != null);
    if (_dio.options.baseUrl == null) {
      return BResponse(isSuccess: false, code: -1);
    }
    try {
      await _request(path, null, req, result, 'POST', cancelToken: cancelToken);
      return BResponse(isSuccess: true, result: result, code: 0);
    } catch (e) {}
  }

  Future<BaseRespR<T>> loginPost<T extends BaseResponse>(
    String path,
    BaseRequest req,
    T result, {
    CancelToken cancelToken,
  }) async {
    assert(_dio.options.baseUrl != null);
    if (_dio.options.baseUrl == null) {
      return BaseRespR(code: -1);
    }
    var request = Request(
      dio: _dio,
      path: path,
      data: req?.toJson(),
      cancelToken: cancelToken,
      requestOptions: RequestOptions(
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.json,
        method: "POST",
        baseUrl: _dio.options.baseUrl,
      ),
    );
    RealCall realCall = RealCall(interceptorList: _netWorkInterceptor);
    final response = await realCall.execute(request).catchError((e) {
      if (e.runtimeType == DioError) {
        DioError error = e;
        print('${error.toString()}');
      }
    });

    var resp = WanAndroidBaseResponse.fromJson(response.data);
    if (resp.errorCode == -1) {
      return BaseRespR(code: resp.errorCode, msg: resp.errorMsg);
    }

    if (result != null && resp.data != null) {
      try {
        result.fromJson(resp.data);
        return BaseRespR(
            code: response.statusCode, msg: response.statusMessage, data: result, response: response);
      } catch (e) {
        if (_debuggable) {
          throw Exception(e);
        }
      }
    }
  }

  Future<BResponse<T>> get<T extends BaseResponse>(
    String path,
    BaseRequest req,
    T result, {
    CancelToken cancelToken,
  }) async {
    assert(_dio.options.baseUrl != null);
    if (_dio.options.baseUrl == null) {
      return BResponse(isSuccess: false, code: -1);
    }
    try {
      await _request(path, req?.toJson(), null, result, 'GET', cancelToken: cancelToken);
      return BResponse(isSuccess: true, result: result, code: 0);
    } catch (e) {}
  }

  Future<T> _request<T extends BaseResponse>(
    String path,
    Map<String, dynamic> queryParameters,
    BaseRequest body,
    T result,
    String method, {
    CancelToken cancelToken,
  }) async {
    var request = Request(
      dio: _dio,
      path: path,
      data: body?.toJson(),
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      requestOptions: RequestOptions(
        contentType: Headers.formUrlEncodedContentType,
        method: method,
        baseUrl: _dio.options.baseUrl,
      ),
    );
    RealCall realCall = RealCall(interceptorList: _netWorkInterceptor);
    final response = await realCall.execute(request).catchError((e) {
      if (e.runtimeType == DioError) {
        DioError error = e;
        print('${error.toString()}');
      }
    });

    var resp = WanAndroidBaseResponse.fromJson(response.data);
    if (result != null && resp.data != null) {
      try {
        result.fromJson(resp.data);
      } catch (e) {
        if (_debuggable) {
          throw Exception(e);
        }
      }
    }
    return result;
  }
}
