import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<BottomNavigationBarItem> navBottomItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    title: Text('首页'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add_alert),
    title: Text('消息'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.people),
    title: Text('我的'),
  ),
];
