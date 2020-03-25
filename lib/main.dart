import 'package:flutter/material.dart';
import 'package:flutter_app/views/DecoratedBoxDemo.dart';
import 'package:flutter_app/views/LayoutDemo.dart';
import 'package:flutter_app/views/ListTileDemo.dart';
import 'package:flutter_app/views/ListViewDemo.dart';
import 'package:flutter_app/views/MixinsDemo.dart';
import 'package:flutter_app/views/SearchDemo.dart';
import 'package:flutter_app/views/SearchDemo2.dart';
import 'package:flutter_app/views/SomeKeyDemo.dart';
import 'package:flutter_app/views/StatefulWidgetDemo.dart';
import 'package:flutter_app/views/httpdemo/HttpDemo.dart';
import 'package:flutter_app/views/providerdemo/Counter.dart';
import 'package:flutter_app/views/providerdemo/ProviderDemo.dart';
import 'package:flutter_app/views/providerdemo/ProviderSecond.dart';
import 'package:flutter_app/widgetdemo/Demo.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(ChangeNotifierProvider.value(
    value: Counter(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//      home: Demo(),
      routes: {
        '/home': (BuildContext context) => Demo(),
        '/home/one': (BuildContext context) => SearchDemo(),
        '/home/two': (BuildContext context) => SearchDemo2(),
        '/home/layout': (BuildContext context) => LayoutDemo(),
        '/home/tiledemo': (BuildContext context) => ListTileDemo(),
        '/home/listviewdemo': (BuildContext context) => ListViewDemo(),
        '/home/StatefulWidgetDemo': (BuildContext context) =>
            StatefulWidgetDemo(),
        '/home/DecoratedBoxDemo': (BuildContext context) => DecoratedBoxDemo(),
        '/home/SomeKeyDemo': (BuildContext context) => SomeKeyDemo(),
        '/home/MixinsDemo': (BuildContext context) => MixinsDemo(),
        '/home/ProviderDemo': (BuildContext context) => ProviderDemo(),
        '/home/ProviderSecond': (BuildContext context) => ProviderSecond(),
        '/home/HttpDemo': (BuildContext context) => HttpDemo(),
      },
      initialRoute: '/home/HttpDemo',
    );
  }
}

//class MyApp extends StatelessWidget {
//  CountModel _countModel = CountModel();
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return ScopedModel<CountModel>(
//      model: _countModel,
//      child: MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          // This is the theme of your application.
//          //
//          // Try running your application with "flutter run". You'll see the
//          // application has a blue toolbar. Then, without quitting the app, try
//          // changing the primarySwatch below to Colors.green and then invoke
//          // "hot reload" (press "r" in the console where you ran "flutter run",
//          // or simply save your changes to "hot reload" in a Flutter IDE).
//          // Notice that the counter didn't reset back to zero; the application
//          // is not restarted.
//          primarySwatch: Colors.green,
//        ),
////      home: MyHomePage(title: 'Flutter Demo Home Page'),
//      home: ScopedModelTop(),
//        routes: {
//          '/home': (BuildContext context) => Demo(),
//          '/home/one': (BuildContext context) => SearchDemo(),
//          '/home/two': (BuildContext context) => SearchDemo2(),
//          '/home/layout': (BuildContext context) => LayoutDemo(),
//          '/home/tiledemo': (BuildContext context) => ListTileDemo(),
//          '/home/listviewdemo': (BuildContext context) => ListViewDemo(),
//          '/home/StatefulWidgetDemo': (BuildContext context) =>
//              StatefulWidgetDemo(),
//          '/home/DecoratedBoxDemo': (BuildContext context) =>
//              DecoratedBoxDemo(),
//          '/home/SomeKeyDemo': (BuildContext context) => SomeKeyDemo(),
//          '/home/MixinsDemo': (BuildContext context) => MixinsDemo(),
//          '/home/ScopedModelTop': (BuildContext context) => ScopedModelTop(),
//        },
////        initialRoute: '/home/ScopedModelTop',
//      ),
//    );
//  }
//}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _tabIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: Icon(Icons.done_outline),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: Icon(Icons.add), title: new Text("测试效果")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.add), title: new Text("测试效果")),
        ],
        selectedItemColor: Color.fromARGB(255, 255, 100, 100),
        onTap: (index) {
//          _counter++;
//          print("測試數據");
          _incrementCounter();
          _tabIndex = index;
        },
        currentIndex: _tabIndex,
      ),
      bottomSheet: Text('底部弹出框'),
    );
  }
}
