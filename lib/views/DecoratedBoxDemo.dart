import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: DecoratedBoxTest(),
    );
  }
}

class DecoratedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.green])),
        child: Padding(
          padding: EdgeInsets.all(20),
            child: AppBar(
                leading: Icon(IconData(0xe6b3,fontFamily: 'projttf',matchTextDirection: true)),
            ),
        ));
  }
}
