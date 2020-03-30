import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateChangeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateChangeState();
}

class StateChangeState extends State<StateChangeDemo> {
  var toggle = false;

  @override
  Widget build(BuildContext context) {
    print("StateChangeSteta build的方法重构了");
    return Scaffold(
      appBar: AppBar(title: Text('控件状态改变')),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Center(
            child: _getToggleChild(),
          )),
    );
  }

  void _onClick() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return InkWell(
        child: Text('我是一个文本'),
        onTap: _onClick,
      );
    } else {
      return RaisedButton(
        onPressed: _onClick,
        child: Text('点击切换成文本'),
      );
    }
  }
}
