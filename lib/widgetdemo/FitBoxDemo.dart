import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FitBoxDemo'),
        centerTitle: true,
      ),
      body: Container(
        width: 500,
        height: 500,
        color: Colors.red,
        child: FittedBox(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          child: Container(
            color: Colors.amber,
            child: Text('文字显示'),
          ),
        ),
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatioDemo'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.red,
        child: AspectRatio(
          aspectRatio: 4,
          child: Container(
            color: Colors.yellow,
            child: Text(
              'aspectRatio 练习',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ConstrainBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('ConstrainBoxDemo'),
        ),
        body: Center(
          child: Text('ConstrainBoxDemo'),
        ),
      );
}

class BaselineDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('appBar'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Baseline(
              baseline: 10,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                '第一列的文字',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            Baseline(
              baseline: 10,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                '第二列的文字',
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
            Baseline(
              baseline: 10,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                '第三列的文字',
                style: TextStyle(fontSize: 8, color: Colors.deepOrangeAccent),
              ),
            )
          ],
        ),
      ));
}

class VisibilityDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VisibilityState();
}

class VisibilityState extends State<VisibilityDemo> {
  bool _isShow = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('测试文本'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Visibility(
                  visible: _isShow,
                  replacement: Image.asset('assets/images/gof.webp'),
                  child: Text('控制文本的显示'),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text('我是第二行'),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.brush),
          onPressed: _changeShow,
        ),
      );

  void _changeShow() {
    setState(() {
      _isShow = !_isShow;
    });
  }
}
