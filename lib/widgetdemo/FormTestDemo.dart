import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providerutil/provider_widget.dart';
import 'package:flutter_app/view_model/login_view_model.dart';
import 'package:flutter_app/widgetdemo/loading.dart';
import 'package:provider/provider.dart';

class FormTestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormTestState();
}

class FormTestState extends State<FormTestDemo> {
  TextEditingController accountController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String resultStr = "返回的结果";

  @override
  Widget build(BuildContext context) {
    print("我是父类的build函数");
    return Scaffold(
        backgroundColor: Colors.white,
        body: ProviderWidget<LoginViewModel>(
            model: LoginViewModel(),
            builder: (context, model, child) {
              return child;
            },
            onModelReady: (model) {},
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    //类似于Andorid的wrap属性
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Image(
                            image:
                                AssetImage("assets/images/logins_bg_img.png")),
                        Image.asset(
                          "assets/images/login_icon_logo.png",
                          width: 100,
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Text(
                        '登录',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(top: 60, left: 40, right: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              maxLines: 1,
                              maxLength: 10,
                              controller: accountController,
                              autofocus: false,
                              decoration: InputDecoration(
                                  labelText: "用户名",
                                  focusColor: Color(0xFF183FF5),
                                  icon: Image.asset(
                                    'assets/images/account.png',
                                    width: 25,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF183FF5))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF183FF5)))),
                              validator: (txt) {
                                if (txt.isEmpty) {
                                  return "请输入用户名";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              maxLines: 1,
                              maxLength: 10,
                              controller: pwdController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: "密码",
                                icon: Image.asset('assets/images/password.png',
                                    width: 25),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF183FF5))),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF183FF5))),
                              ),
                              validator: (txt) {
                                if (txt.isEmpty) {
                                  return "请输入用户名";
                                }
                                return null;
                              },
                            ),
//                            CupertinoActivityIndicator(
//                              radius: 30,
//                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60, left: 40, right: 40),
                      width: double.infinity,
                      child: _LoginButton(accountController, pwdController),
                    ),
                    Text(resultStr),
                  ],
                ),
              ),
            )));
  }

//  void _loginApp() {
//    print('点击了登录按钮');
//    //加载的dialvar loginViewModel = Provider.of<LoginViewModel>(context, listen: false);og尽量封装到viewmodel里面去
//
//    showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return LoadingDialog(
//            text: '登录中...',
//          );
//        });
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      loginViewModel
//          .loginByPwd(accountController.text, pwdController.text)
//          .then((value) {
////        resultStr = (value as LoginResultBean).loginUserInfo.token;
//        showToast("登录成功", dismissOtherToast: true);
//        Navigator.of(context).pop();
//      });
//    }
//  }
}

class _LoginButton extends StatelessWidget {
  final userNameController;
  final pwdController;

  _LoginButton(this.userNameController, this.pwdController);

  @override
  Widget build(BuildContext context) {
    print("build loginButton");
    var viewModel = Provider.of<LoginViewModel>(context);
    return viewModel.busy
        ? CircularProgressIndicator()
        : FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              '登录',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return LoadingDialog(
                      text: '登录中...',
                    );
                  });
              viewModel
                  .loginByPwd(userNameController.text, pwdController.text)
                  .then((it) {
                Navigator.of(context).pop();
              });
            },
            color: Color(0xFF183FF5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(28))),
          );
  }
}
