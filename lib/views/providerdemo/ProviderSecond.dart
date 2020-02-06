import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/providerdemo/Counter.dart';
import 'package:provider/provider.dart';

class ProviderSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('我是ProviderSecond'),
        leading: Icon(Icons.navigate_before),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.navigate_next),
                onPressed: () => Navigator.pushNamed(context, ""),
              ),
              Text("其它页面的 ${Provider.of<Counter>(context).count}")
            ],
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Provider.of<Counter>(context).increment()),
    );
  }
}
