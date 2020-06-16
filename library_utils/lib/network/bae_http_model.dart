import 'package:dio/dio.dart';

abstract class BaseRequest {
  Map<String, dynamic> toJson();
}

abstract class BaseResponse {
  void fromJson(dynamic json);
}

class WanAndroidBaseResponse {
  int errorCode;
  String errorMsg;
  dynamic data;

  WanAndroidBaseResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    data = json['data'];
  }
}

class BResponse<T> {
  final bool isSuccess;
  final String errMessage;
  final int code;
  final dynamic extInfo;
  final T result;

  BResponse({this.isSuccess = false, this.errMessage, this.result, this.code, this.extInfo});

  @override
  String toString() {
    return 'BResponse{isSuccess: $isSuccess, errMessage: $errMessage, code: $code, extInfo: $extInfo, result: $result}';
  }
}
class BaseRespR<T> {
  String status;
  int code;
  String msg;
  T data;
  Response response;

  BaseRespR({this.status, this.code, this.msg, this.data, this.response});

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

