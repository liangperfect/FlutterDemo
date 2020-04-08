//请求网络访问

import 'package:flutter_app/service/api.dart';
import 'package:flutter_app/service/my_api.dart';
import 'package:flutter_app/views/diodemo/DeviceSite.dart';
import 'package:flutter_app/views/diodemo/LoginResultBean.dart';

class MyRepository {
  //登录
  static Future doLogin(String userName, String userPwd) async {
    print('提交的参数:$userName   $userPwd');
    FormData formData =
        FormData.fromMap({'UserName': userName, 'UserPwd': userPwd});

    var response = await http.post('/api/AppUsers/Login', data: formData);
    return LoginResultBean.fromJson(response.data);
  }

  //获取设备列表
  ///api/AppEquipment/GetListPage
  static Future<List<DeviceItem>> fetchDeviceList(int pageIndex, int pageSize,
      {String equipmentNamem, int state}) async {
    //获取设备列表
    print('chenliang 开始网络请求');
    var response = await http.get("/api/AppEquipment/GetListPage",
        queryParameters: {'pageIndex': pageIndex, 'pageSize': pageSize});
//    return response.data['data']
    return DeviceSite.fromJson(response.data).rows;
//    var devices = List<DeviceItem>();
//    for (int i = 0; i < Random().nextInt(30); i++) {
//      devices
//          .add(DeviceItem(currEnterpriseName: '当前第:${Random().nextInt(100)}'));
//    }
//    return devices;
  }
}
