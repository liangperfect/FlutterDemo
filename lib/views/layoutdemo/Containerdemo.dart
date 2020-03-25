import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Containerdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录界面"),
      ),
      body: Container(
        child: Text("我是登录界面"),
      ),
    );
  }
}
