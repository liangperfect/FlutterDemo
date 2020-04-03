import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioTestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DioTestState();
}

class DioTestState extends State<DioTestDemo> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Dio网络测试'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Dio网络获取数据'),
        ),
      );
}
