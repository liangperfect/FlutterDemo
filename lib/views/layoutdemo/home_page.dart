import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
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
                          child: Image.asset(
                            'assets/images/search.png',
                            width: 250,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

