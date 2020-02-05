import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListTitle Demo'),
        ),
      body: _ListTileTest(),
    );
  }
}

class _ListTileTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Card(
            color: Colors.green,
            elevation: 20,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: ListTile(
                title: Text('海贼王'),
                subtitle: Text('格林城东门丹尼斯'),
                leading: Icon(Icons.airport_shuttle),
                trailing: Icon(Icons.chevron_left),
                dense: false,
                onTap: _showItem,
                onLongPress: _showItem,
                selected: false,
              ),
            ),
          )
        ) ,
    );
  }

  void _showItem(){

  }
}
