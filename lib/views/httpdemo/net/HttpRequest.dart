import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = options.baseUrl = 'https://www.wanandroid.com/';
    //暂时未添加拦截去，去添加头部的token
    interceptors..add(ApiInterceptor());
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    print('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
//    ResponseData responseData = ResponseData.fromJson(response.data);
//    print("chenliang,請求返回的數據->");
//    print("chenliang:"+response.toString());
    return super.onResponse(response);
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 0 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['errorCode'];
    message = json['errorMsg'];
    data = json['data'];
  }
}
