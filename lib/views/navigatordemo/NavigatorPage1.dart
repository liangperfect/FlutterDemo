import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/navigatordemo/NavigatorPage2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigatorPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<NavigatorPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('跳转到下一张界面'),
          onPressed: _nextPage,
        ),
      ),
    );
  }

  void _nextPage() {
    //通过静态注册跳转页面
    // Navigator.pushNamed(context, '/home/navigatorpage2');

    Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigatorPage2("asd")))
        .then((Object strs) {
      Fluttertoast.showToast(msg: '从关闭也返回来的数据是${strs.toString()}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    print('page1 dispose');
  }
}
