import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'CountModel.dart';

class ScopedModelTop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TopState();
}

class TopState extends State<ScopedModelTop> {
  void getTest({branche = true}) {
    if (branche) {
      //还必须有分号，靠
      print("测试一下");
    }
  }

  //静态获取model用法实例
  Model getModel(BuildContext context) {
    //直接使用of
    final countModel = ScopedModel.of<CountModel>(context);
    //使用CountModel中重写的of
    final countModel2 = CountModel().of(context);

    countModel.increment();
    countModel2.increment();
    TextEditingController v = TextEditingController();
    v.value = TextEditingValue(text: "设置了control");
    return countModel;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('我是父页面'),
            leading: Icon(Icons.camera_roll),
          ),
          body: Text('${model.count}'),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.navigate_next),
            onPressed: _goUnder,
          ),
        );
      },
    );
  }

  void _goUnder() {
    Navigator.pushNamed(context, "");
  }
}
