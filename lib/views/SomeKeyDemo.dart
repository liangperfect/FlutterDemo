import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SomeKeyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SomeKeyState();
}

class _SomeKeyState extends State<SomeKeyDemo> {
  List<Widget> widgets = [
    _KeyTest(
      Colors.yellow,
      key: UniqueKey(),
    ),
    _KeyTest(Colors.green, key: UniqueKey())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('key的相关测试演示'),
        leading: Icon(Icons.ac_unit),
      ),
      body: Center(
        child: Row(
          children: widgets,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _switchWidget,
      ),
    );
  }

  _switchWidget() {
    widgets.insert(0, widgets.removeAt(1));
    print('log 查看');
    setState(() {});
  }
}

/**
 * 无状态的widget
 */
//class _keyTest1 extends StatelessWidget {
//  Color color;
//
//  _keyTest1(this.color);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 100,
//      height: 100,
//      color: color,
//    );
//  }
//}

/**
 *  有状态的widget
 */
class _KeyTest extends StatefulWidget {
  @required
  Color color;

  _KeyTest(this.color, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _KeyTestState(color);
}

class _KeyTestState extends State<_KeyTest> {
  Color color;

  _KeyTestState(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

//class _GlobalKeyTest extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//  }
//}
//
//class _LocalKeyTest extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//  }
//}
