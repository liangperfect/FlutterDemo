import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/config/page_route_anim.dart';
import 'package:flutter_app/views/diodemo/DioTestDemo.dart';
import 'package:flutter_app/views/layoutdemo/ListViewDemo.dart';
import 'package:flutter_app/views/layoutdemo/device_list_page.dart';
import 'package:flutter_app/views/layoutdemo/home_page.dart';
import 'package:flutter_app/views/navigatordemo/NavigatorPage1.dart';
import 'package:flutter_app/views/navigatordemo/NavigatorPage2.dart';
import 'package:flutter_app/widgetdemo/FitBoxDemo.dart';
import 'package:flutter_app/widgetdemo/FormTestDemo.dart';
import 'package:flutter_app/widgetdemo/tabview_demo.dart';

class RouterName {
  static const String main = "/";
  static const String navigatorpage1 = "navigatorpage1";
  static const String navigatorpage2 = "navigatorpage2";
  static const String formtestdemo = "formtestdemo";
  static const String fitboxdemo = "fitboxdemo";
  static const String aspectrationdemo = "aspectrationdemo";
  static const String constrainboxdemo = "constrainboxdemo";
  static const String baselinedemo = "baselinedemo";
  static const String visibilitydemo = "visibilitydemo";
  static const String diotestdemo = "diotestdemo";
  static const String login = "login";
  static const String builderdemo = "builderdemo";
  static const String listviewdemo = "listviewdemo";
  static const String devicelistpage = "devicelistpage";
  static const String tabviewdemo = "tabviewdemo";
  static const String homepagetest = "homepagetest";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.main:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePageTestWidget());
      case RouterName.tabviewdemo:
        return MaterialPageRoute(
            builder: (BuildContext context) => TabViewDemo());
      case RouterName.devicelistpage:
        return MaterialPageRoute(
            builder: (BuildContext context) => DeviceListPage());
      case RouterName.listviewdemo:
        return NoAnimRouteBuilder(ListViewDemo());
      case RouterName.formtestdemo:
        //完整的登录界面
//        return  NoAnimRouteBuilder(FormTestDemo());
        return MaterialPageRoute(
            builder: (BuildContext context) => FormTestDemo());
      case RouterName.diotestdemo:
        return NoAnimRouteBuilder(DioTestDemo());
      case RouterName.visibilitydemo:
        return NoAnimRouteBuilder(VisibilityDemo());
      case RouterName.baselinedemo:
        return NoAnimRouteBuilder(BaselineDemo());
      case RouterName.constrainboxdemo:
        return NoAnimRouteBuilder(ConstrainBoxDemo());
      case RouterName.aspectrationdemo:
        return NoAnimRouteBuilder(AspectRatioDemo());
      case RouterName.fitboxdemo:
        return NoAnimRouteBuilder(FitBoxDemo());
      case RouterName.navigatorpage1:
        return NoAnimRouteBuilder(NavigatorPage1());
      case RouterName.main:
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
