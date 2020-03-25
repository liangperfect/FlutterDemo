import 'package:flutter_app/views/httpdemo/net/HttpRequest.dart';

class WanAndroidRespository {
  //輪播圖
  static Future fetchBanners() async {
    var response = await http.get('banner/json');
    print("返回的數據是");
    return response.data;
  }
}
