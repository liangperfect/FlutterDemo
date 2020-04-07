import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart'; // 1. import library

import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
//    options.baseUrl = 'https://www.wanandroid.com/';
    options.baseUrl = 'http://39.99.133.145:186';
    //加这块代码是为了让Charles抓包工具能抓包
    interceptors..add(ApiInterceptor());
//    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (client) {
//      // config the http client
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
////        return "PROXY 192.168.10.184:8888";
//        return "PROXY 172.16.3.85:8888";
//      };
//    };
    // cookie持久化 异步
//      ..add(CookieManager(
//          PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
//    debugPrint('---api-request--->data--->${options.data}');
    return options;
  }

  @override
  onResponse(Response response) {
    ResponseData respData = ResponseData.fromJson(response.data);
    print('chenliang 打印出的log是${respData.code}');
    if (respData.success) {
      response.data = respData.data;
      return http.resolve(response);
    } else {
      showToast(respData.message,
          textPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          duration: Duration(seconds: 3));
      if (respData.code == -1001) {
        // 如果cookie过期,需要清除本地存储的登录信息
        // StorageManager.localStorage.deleteItem(UserModel.keyUser);
        throw const UnAuthorizedException(); // 需要登录
      } else {
        //通过抛出错误来监听错误信息
        throw NotSuccessException.fromRespData(respData);
      }
      //todo 添加一个token过期的error来进行重新登录
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 200 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
