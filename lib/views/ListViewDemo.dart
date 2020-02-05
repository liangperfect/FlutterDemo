import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listView的demo'),
        leading: Icon(Icons.alternate_email),
        actions: <Widget>[
          Icon(Icons.account_balance),
          Icon(Icons.account_box),
          Icon(Icons.alarm_add),
        ],
      ),
      body: _ListViewTest1(),
    );
  }
}

class _ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: <Widget>[
          ListItemView('liang', 1),
          ListItemView('chen', 2),
          ListItemView('xiaomei', 3),
          ListItemView('xiaoan', 6),
//              ListItemView('xiaoan', 6),
//              ListItemView('xiaoan', 6),
//              ListItemView('xiaoan', 6),
//              ListItemView('xiaoan', 6),
        ],
        primary: true,
      ),
    ));
  }
}

class _ListViewTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: ListView.builder(itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text('第'+index.toString()),
              subtitle: Text(''+Random().nextInt(10).toString()),
              leading: Icon(Icons.account_balance),
            ),

          );
        },
        itemCount: 20,
        ),
    ));
  }
}

// ignore: must_be_immutable
class ListItemView extends StatelessWidget {
  String name = "";
  int age = 0;

  ListItemView(this.name, this.age) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(name),
          subtitle: Text("當前分數" + age.toString()),
          leading: Icon(Icons.account_box),
        ),
      ),
    );
  }
}
