import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  TextEditingController phoneControler = TextEditingController();
  TextEditingController pwdControler = TextEditingController();

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              '登录',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            pinned: true,
            actions: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: InkWell(
                    onLongPress: () {
                      //长按反馈
                    },
                    onTap: () {
                      //点击反馈
                      Fluttertoast.showToast(
                          msg: "点击了注册按钮", toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Text(
                      '注册',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(0.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  //一张图片
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/pic.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 5, top: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 42,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //用户名输入框图标
                              margin: EdgeInsets.only(top: 5, right: 20),
                              child: Icon(
                                Icons.phone_iphone,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: widget.phoneControler,
                                keyboardType: TextInputType.phone,
                                maxLines: 11,
                                minLines: 1,
                                decoration: InputDecoration(
                                    hintText: '手机号码',
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey[300])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.grey[300]))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 42,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5.0, right: 10.0),
                              child: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: widget.pwdControler,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: '密码',
                                    suffix: Text('忘记密码?'),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.grey[300],
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Theme.of(context)
                                                .primaryColor))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: '点击登录按钮并成功跳转',
                                toastLength: Toast.LENGTH_SHORT);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              '登录',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
