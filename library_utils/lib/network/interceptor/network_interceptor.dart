import 'package:dio/dio.dart';

abstract class NetWorkInterceptor {
  Future<Response> intercept(Chain chain, Request request);
}

abstract class Chain {
  Future<Response> proceed(Request request);
}

class Request {
  Dio dio;
  RequestOptions requestOptions;
  String path;
  dynamic data;
  Map<String, dynamic> queryParameters;
  CancelToken cancelToken;

  Request({
    this.dio,
    this.requestOptions,
    this.path,
    this.data,
    this.queryParameters,
    this.cancelToken,
  });
}

class RealCall {
  List<NetWorkInterceptor> interceptorList;

  RealCall({this.interceptorList = const []});

  Future<Response> execute(Request request) async {
    List<NetWorkInterceptor> list = [];
    list.addAll(interceptorList);
    list.add(DioRequestNetWorkInterceptor());

    RealChain realChain = RealChain(list, 0);
    Response response = await realChain.proceed(request);
    return response;
  }
}

class RealChain implements Chain {
  int index;
  List<NetWorkInterceptor> interceptorList;

  RealChain(this.interceptorList, this.index);

  @override
  Future<Response> proceed(Request request) async {
    if (index >= interceptorList.length) {
      throw new AssertionError('index $index is max than interceptorList.length ${interceptorList.length}');
    }
    RealChain next = RealChain(interceptorList, index + 1);
    NetWorkInterceptor interceptor = interceptorList[index];
    Response response = await interceptor.intercept(next, request);
    return response;
  }
}

class DioRequestNetWorkInterceptor implements NetWorkInterceptor {
  @override
  Future<Response> intercept(Chain chain, Request request) async {
    Response response = await request.dio.request(
      request.path,
      data: request.data,
      options: request.requestOptions,
      queryParameters: request.queryParameters,
      cancelToken: request.cancelToken,
    );

    return response;
  }
}
