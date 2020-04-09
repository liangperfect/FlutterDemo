import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgetdemo/dialog_utils.dart';

class TabViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabViewState();
}

class TabViewState extends State<TabViewDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            width: double.infinity,
            color: Color(0xFFF7F7F8),
            height: 1,
          ),
          preferredSize: Size(0, 0),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF183FF5),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'tabView列表切换',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              child: TabBar(
                controller: this._tabController,
                tabs: <Widget>[Text('实时数据'), Text('历史轨迹'), Text('设备信息')],
                labelStyle: TextStyle(fontSize: 14),
                indicatorColor: Color(0xFF183FF5),
                labelColor: Colors.black,
                indicatorWeight: 4,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding:
                    EdgeInsets.symmetric(vertical: -8, horizontal: 8),
                unselectedLabelColor: Color(0xFFA7ACBA),
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Color(0xFFF7F7F8),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: this._tabController,
                children: <Widget>[
                  Container(
                    child: Text('page1'),
                    color: Colors.amber,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    child: Text('page2'),
                    alignment: Alignment.center,
                    color: Colors.blue,
                  ),
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          'page3',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        FlatButton(
                          color: Colors.deepOrange,
                          child: Text('点击跳转页面'),
                          onPressed: () {
//                            Navigator.of(context)
//                                .pushNamed(RouterName.devicelistpage);
//                            showModalBottomSheet(
//                                context: context,
//                                builder: (_) {
//                                  return Stack(
//                                    children: <Widget>[
//                                      Container(
//                                        height: 30.0,
//                                        width: double.infinity,
//                                        color: Colors.black54,
//                                      ),
//                                      Container(
//                                        decoration: BoxDecoration(
//                                            color: Colors.white,
//                                            borderRadius: BorderRadius.only(
//                                                topLeft: Radius.circular(25),
//                                                topRight: Radius.circular(25))),
//                                      ),
//                                      Container(
//                                        child: Center(
//                                          child: Text('我是弹出来的dialog'),
//                                        ),
//                                      )
//                                    ],
//                                  );
//                                });
                            DialogUtils.showSelectModelDialog(context, 1,
                                (index) {
                              print('选择的是第$index');
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }
}
