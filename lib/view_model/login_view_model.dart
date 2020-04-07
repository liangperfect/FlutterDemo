import 'package:flutter_app/providerutil/view_state_model.dart';
import 'package:flutter_app/service/my_repository.dart';
import 'package:flutter_app/views/diodemo/LoginResultBean.dart';

class LoginViewModel extends ViewStateModel {
  //这里是网络请求返回的数据
  LoginResultBean loginResultBean;

  Future<LoginResultBean> loginByPwd(loginName, pwd) async {
    setBusy();
    try {
      loginResultBean = await MyRepository.doLogin(loginName, pwd);
      setIdle(); //也可以设置成功
      return loginResultBean;
    } catch (e, s) {
      setError(e, s);
      return loginResultBean;
    }
  }
}
