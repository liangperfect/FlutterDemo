import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MeiTuanHome2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MeiTuanHomeState2();
}

class MeiTuanHomeState2 extends State<MeiTuanHome2> {
  ScrollController _scrollController = ScrollController();
  final _tabs = <String>['TabA', 'TabB'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: _createAppBar(),
        body: Container(
//            color: Colors.yellow,
//            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Container(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 3), () {
            Fluttertoast.showToast(msg: '数据刷线完成');
          });
        },
        child: Column(
          children: <Widget>[
            _createCustomRow(),
            Expanded(
              child: _createContent(),
            )
          ],
        ),
      ),
    )));
  }

  Future<String> _getCustomFuture() => Future.delayed(Duration(seconds: 3), () {
        return "";
      });

  AppBar _createAppBar() => AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        flexibleSpace: SafeArea(
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/images/e8i.webp'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '三河',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 14)
                    ],
                  ),
                  Text(
                    '晴 20',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                height: 50,
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.search),
                      Text(
                        '自助烤肉',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              )),
              IconButton(
                icon: Icon(Icons.highlight),
                iconSize: 26,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 26,
                onPressed: () {},
              )
            ],
          ),
        ),
      );

  /**
   * 自定义的APPbar
   */
  Container _createCustomRow() => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(8.0),
            child: Image.asset('assets/images/e8i.webp'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '三河',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 14)
                ],
              ),
              Text(
                '晴 20',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Expanded(
              child: Container(
            height: 50,
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.search),
                  Text(
                    '自助烤肉',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          )),
          IconButton(
            icon: Icon(Icons.highlight),
            iconSize: 26,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 26,
            onPressed: () {},
          )
        ],
      ));

  /**
   * 热搜部分
   */
  Row _createHotSearch() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('热搜：'),
          Text('口罩'),
          Container(
            width: 8,
          ),
          Text('|'),
          Container(
            width: 8,
          ),
          Text('安心返工'),
          Container(
            width: 8,
          ),
          Text('|'),
          Container(
            width: 8,
          ),
          Text('午餐外卖'),
          Container(
            width: 8,
          ),
          Text('|'),
          Container(
            width: 8,
          ),
          Text('披萨'),
          Container(
            width: 8,
          ),
          Text('|'),
          Container(
            width: 8,
          ),
          Text('大米'),
          Container(
            width: 8,
          ),
        ],
      );

  Row _createOperation() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _createOptItem('assets/images/e8i.webp', '扫一扫'),
          _createOptItem('assets/images/e8i.webp', '付款码'),
          _createOptItem('assets/images/e8i.webp', '骑车'),
          _createOptItem('assets/images/e8i.webp', '查公交'),
        ],
      );

  Column _createOptItem(String imgPath, String methodName) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: Image.asset(imgPath),
          ),
          Text(methodName)
        ],
      );

  Row _createMethod2() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _createOptItem('assets/images/pic.jpg', '外卖'),
          _createOptItem('assets/images/pic.jpg', '美食'),
          _createOptItem('assets/images/pic.jpg', '酒店住宿'),
          _createOptItem('assets/images/pic.jpg', '休闲/玩乐'),
        ],
      );

  /**
   * MediaQuery.removePadding
   * 解决没有AppBar，ListView头部留有空白的问题
   */
  Widget _createContent() => MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: _scrollController,
//        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/pic.jpg",
                  fit: BoxFit.fill,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //Custom App Bar
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                      child: _createHotSearch(),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                      child: _createOperation(),
                    ),
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 0.0),
                                child: _createMethod2(),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ));

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }
}
