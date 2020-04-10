import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}



class HomePageState extends State<HomePageTestWidget> {
  RefreshController _refreshController =
  RefreshController(initialRefresh: true);
  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(seconds: 2));
//    items.add((items.length + 1).toString());
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(),
            Expanded(
              child: Container(
                color: Color(0xFFF7F7F8),
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: MaterialClassicHeader(),
                  footer: CustomFooter(builder: (BuildContext context, LoadStatus mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(
                        child: body,
                      ),
                    );
                  }),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  LoginTopPanel(),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 24,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/home_head_icon.png",
                                            width: 148,
                                            height: 148,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                '280',
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                '总共设备(个)',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                '20',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                '异常设备',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          Text('|',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24)),
                                          Column(
                                            children: <Widget>[
                                              Text('20',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 24)),
                                              Text('异常设备',
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 16),
                                        child: Card(
                                          elevation: 4,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  DeviceStateItem(),
                                                  DeviceStateItem()
                                                ],
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  DeviceStateItem(),
                                                  DeviceStateItem()
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 16),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '设备列表',
                                          style:
                                          TextStyle(color: Colors.grey[500]),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverFixedExtentList(
                        itemExtent: 50,
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.center,
                                color: Colors.lightBlue[100 * (index % 9)],
                                child: Text('ListView的第$index个item'),
                              );
                            }, childCount: 20),
                      )
                    ],
                  ),
                ) ,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DeviceStateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 75,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset('assets/images/home_early.png'),
              Container(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '预警设备',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '100个设',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: 82,
      color: Color(0xFFED3A3A),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/images/location_white.png'),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    '成都',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/search.png',
                        width: 250,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginTopPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomClipper(),
      child: Container(
        height: 370,
        color: Color(0xFFED3A3A),
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);

    var p1 = Offset(size.width / 2, size.height);
    var p2 = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
