import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RefreshIndicatorState();
}

class RefreshIndicatorState extends State {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新demo'),
      ),
      body: RefreshIndicator(
          child: Container(
            child: Text(
              '刷新数据',
              style: TextStyle(fontSize: 20),
            ),
          ),
          onRefresh: () {}),
    );
  }
}
