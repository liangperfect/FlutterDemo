import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StackState();
}

class StackState extends State<StackDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack测试")),
      body: Container(
        decoration: BoxDecoration(color: Colors.green),
        child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Text('row1'),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(200,500)),
                  child: Text('row2'),
                ),
                Text('row3'),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ),
    );
  }
}
