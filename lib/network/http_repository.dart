import 'package:library_utils/library_utils.dart';

class HttpRepository {
  static HttpRepository instance = HttpRepository._();
  DefaultHttpClient _httpClient;

  HttpRepository._();

  factory HttpRepository() {
    return instance;
  }

  void initBaseUrl(String baseUrl) {
    if (_httpClient == null) {
      _httpClient = DefaultHttpClient(baseUrl: baseUrl);
    }
  }

  void addInterceptor(Interceptor interceptor) {
    assert(interceptor != null);
    _httpClient.addInterceptor(interceptor);
  }

  void setHeader(String cookie) {
    Map<String, dynamic> _headers = new Map();
    _headers["Cookie"] = cookie;
    _httpClient.dio.options.headers.addAll(_headers);
  }

  Future<BResponse<T>> post<T extends BaseResponse>(String path, {BaseRequest req, T result}) async {
    assert(_httpClient != null);
    return await _httpClient.post(path, req, result);
  }

  Future<BaseRespR<T>> loginPost<T extends BaseResponse>(String path, BaseRequest req, T result) async {
    assert(_httpClient != null);
    return await _httpClient.loginPost(path, req, result);
  }

  Future<BResponse<T>> get<T extends BaseResponse>(String path, BaseRequest req, T result) async {
    assert(_httpClient != null);
    return await _httpClient.get(path, req, result);
  }
}
