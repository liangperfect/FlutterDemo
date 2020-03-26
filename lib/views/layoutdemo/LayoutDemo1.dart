import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo1 extends StatefulWidget {
  String text =
      "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.";

  @override
  State<StatefulWidget> createState() => LayoutState();
}

class LayoutState extends State<LayoutDemo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayoutDemo1'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset("assets/images/pic.jpg"),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Oeschinen   Lake  Campground',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          'Kandersteg,Switzerland',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    flex: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.camera),
                      Text(
                        '41',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
//              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MethodWidget('CALL', Icons.phone),
                  MethodWidget('ROUTE', Icons.near_me),
                  MethodWidget('SHARE', Icons.share),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(32),
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MethodWidget extends StatelessWidget {
  String methodName;
  IconData iconData;

  MethodWidget(this.methodName, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(iconData, color: Colors.blue),
        Text(
          methodName,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
