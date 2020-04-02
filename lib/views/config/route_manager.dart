import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/config/page_route_anim.dart';
import 'package:flutter_app/views/navigatordemo/NavigatorPage1.dart';
import 'package:flutter_app/views/navigatordemo/NavigatorPage2.dart';
import 'package:flutter_app/widgetdemo/FormTestDemo.dart';

class RouterName {
  static const String main = "/";
  static const String navigatorpage1 = "navigatorpage1";
  static const String navigatorpage2 = "navigatorpage2";
  static const String formtestdemo = "formtestdemo";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(
        '${settings.name}   ${settings.arguments}   ${settings.isInitialRoute}');
    switch (settings.name) {
      case RouterName.main:
        return NoAnimRouteBuilder(FormTestDemo());
//      case RouterName.main:
//        return NoAnimRouteBuilder(NavigatorPage1());
      case RouterName.navigatorpage1:
        return NoAnimRouteBuilder(NavigatorPage1());
      case RouterName.navigatorpage2:
        return NoAnimRouteBuilder(NavigatorPage2(settings.arguments));
      default:
        return CupertinoPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
