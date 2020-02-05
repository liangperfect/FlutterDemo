import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.android),
        title: Text('测试界面'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ac_unit),tooltip: '测试弹窗1111',onPressed: null),
          IconButton(icon: Icon(Icons.airline_seat_flat),tooltip: '测试弹窗2222',onPressed: null),
          IconButton(icon: Icon(Icons.av_timer),tooltip: '测试弹窗3333',onPressed: null),
        ],
      ),
      body: Center(
        child: Text('我就是一个中间文本对象'),
      ),
    );
  }
}

