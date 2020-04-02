import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorPage2 extends StatefulWidget {
  String argument = "";

  NavigatorPage2(this.argument);

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<NavigatorPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('我是第二张界面跳转 参数:${widget.argument}'),
            onPressed: _nextPage,
          ),
          RaisedButton(
            child: Text('出栈当前页面'),
            onPressed: _popPage,
          )
        ],
      )),
    );
  }

  void _nextPage() {
    //通过静态注册跳转页面
  }

  void _popPage() {
    //直接出栈
//    Navigator.pop(context);
//    //包含数组参数出栈
    Navigator.pop(context, ['a', 'b', 'c']);
    //包含一个参数出栈
//    Navigator.pop(context, "FromPage2");
  }
}
