import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/layoutdemo/LayoutDemo1.dart';
import 'package:flutter_app/views/layoutdemo/LoginPage.dart';
import 'package:flutter_app/views/layoutdemo/NavBottomItems.dart';
import 'package:flutter_app/widgetdemo/ChipDemo.dart';

class PageIndex extends StatefulWidget {
  PageIndex({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<StatefulWidget> {
  var _pageList = [LoginPage(), LayoutDemo1(), ChipDemo()];
  var _currentIndex = 0;
  var _pageControler = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pageList,
        controller: _pageControler,
        onPageChanged: _onItemTapped,
      ),
//      body: PageView.custom(
//        childrenDelegate: SliverChildBuilderDelegate(
//          (context, index) {
//            return _pageList[index];
//          },
//          childCount: 3,
//        ),
//        controller: _pageControler,
//        onPageChanged: _onItemTapped,
//      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navBottomItems,
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    this.setState(() {
      _currentIndex = index;
    });
    _pageControler.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }



}
