import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountState();
}

class _CountState extends State<StatefulWidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.yellow,
      child: Offstage(
        offstage: false,
        child: RaisedButton(
          child: Text('當前的count' + count.toString()),
          onPressed: _increment,
//          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      alignment: Alignment.center,
    ));
  }
  void _increment() {
    Navigator.of(context).pushNamed('/home/listviewdemo');
//    setState(() {
//      ++count;
//    });
  }
}
