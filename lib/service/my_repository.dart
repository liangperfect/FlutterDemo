//请求网络访问
import 'package:flutter_app/service/api.dart';
import 'package:flutter_app/service/my_api.dart';
import 'package:flutter_app/views/diodemo/LoginResultBean.dart';

class MyRepository {
  static Future doLogin(String userName, String userPwd) async {
    print('提交的参数:$userName   $userPwd');
    FormData formData =
        FormData.fromMap({'UserName': userName, 'UserPwd': userPwd});

    var response = await http.post('/api/AppUsers/Login', data: formData);
    return LoginResultBean.fromJson(response.data);
  }
}
