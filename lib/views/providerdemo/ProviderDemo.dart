import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/providerdemo/Counter.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider状态管理demo'),
        leading: Icon(Icons.navigate_before),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.navigate_next),
                onPressed: () => Navigator.pushNamed(context, "/home/ProviderSecond"),
              ),
              Text("${Provider.of<Counter>(context).count}")
            ],
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Provider.of<Counter>(context).increment()),
    );
  }
}
