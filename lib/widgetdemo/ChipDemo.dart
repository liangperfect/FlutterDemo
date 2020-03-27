import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChipDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChipState();
}

class ChipState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        constraints: BoxConstraints(maxWidth: 100, maxHeight: 200),
        color: Colors.amberAccent,
        alignment: Alignment.centerLeft,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 12,
          children: <Widget>[
            Chip(
              label: Text('我是第一个Chip'),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Chip(
              label: Text('Chip'),
              avatar: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Chip(
              label: Text('我是第三个Chip'),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
