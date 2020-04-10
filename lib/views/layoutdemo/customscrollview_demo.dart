import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomScrollViewState();
}

class CustomScrollViewState extends State<CustomScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: Icon(Icons.access_alarm),
//        title: Text('CustomScrollView以及粘合Sliver的操作'),
//        actions: <Widget>[Icon(Icons.add)],
//      ),
//      body: Center(
//        child: Text('练习CustomScrollView以及粘合Sliver'),
//      ),
//    );
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.deepOrange,
            pinned: true,
            floating: true,
            expandedHeight: 50,
            flexibleSpace: FlexibleSpaceBar(
//              title: Image.asset("assets/images/pic.jpg"),
              title: Text('sliverDemo'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.cyan,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10,
                childAspectRatio: 4.0,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('当前是GridView的第$index个item'),
                );
              }, childCount: 30),
            ),
          ),
//          SliverFixedExtentList(
//            itemExtent: 30,
//            delegate:
//                SliverChildBuilderDelegate((BuildContext context, int index) {
//              return Container(
//                alignment: Alignment.center,
//                color: Colors.lightBlue[100 * (index % 9)],
//                child: Text('ListView的第$index个item'),
//              );
//            }, childCount: 20),
//          )
        ],
      ),
    );
  }
}
