import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Demo2'),
        leading: Icon(Icons.airport_shuttle),
      ),
      body: ConstraintsProperty() ,
    );
  }
}

class ConstraintsProperty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Container(
            color: Colors.green,
//            constraints: BoxConstraints(
//              maxHeight: 300,
//              maxWidth: 200,
//              minWidth: 150,
//              minHeight: 150
//            ),
//            child: Text('asdas'),
          ),
        ),
      );
  }
}
