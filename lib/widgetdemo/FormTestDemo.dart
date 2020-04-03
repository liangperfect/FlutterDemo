import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/service/my_repository.dart';
import 'package:flutter_app/views/diodemo/LoginResultBean.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                //类似于Andorid的wrap属性
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image(image: AssetImage("assets/images/logins_bg_img.png")),
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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
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
                          autofocus: true,
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
                                  borderSide:
                                      BorderSide(color: Color(0xFF183FF5)))),
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
                          autofocus: true,
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
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60, left: 40, right: 40),
                  width: double.infinity,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _loginApp,
                    color: Color(0xFF183FF5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28))),
                  ),
                ),
                Text(resultStr),
              ],
            ),
          ),
        ));
  }

  void _loginApp() {
    final form = _formKey.currentState;
    print("开始进行网络请求");
    if (form.validate()) {
      print("进行收集请求");
      MyRepository.doLogin(accountController.text, pwdController.text)
          .then((r) {
        setState(() {
          resultStr = (r as LoginResultBean).loginUserInfo.token;
        });
      });
//      _fakeHttp().then((result) {
//        if (result == "登录成功") {
//          Navigator.pushNamed(context, RouterName.navigatorpage1);
//        } else {
//          Fluttertoast.showToast(msg: '登录失败，原因是123');
//        }
//      });
    }
  }
}
