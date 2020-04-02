import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/providerdemo/CountModel.dart';
import 'package:flutter_app/views/providerdemo/CountPage2.dart';
import 'package:flutter_app/views/providerdemo/FavoriteModel.dart';
import 'package:provider/provider.dart';

class CountPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return ChangeNotifierProvider.value(
//      value: CountModel(0),
//      child: Container(
//        child: CountPageChild(),
//      ),
//    );
    return CountPageChild();
  }
}

class CountPageChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //在子Widget去更装填
    final CountModel _countModel = Provider.of<CountModel>(context);
    final FavoriteModel _favoriteModel = Provider.of<FavoriteModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('第一张Count界面'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('第一张界面的Count: ${_countModel.getCount()}'),
          FlatButton(
            color: Colors.yellow,
            onPressed: () {
              //前往下一张界面
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CountPage2()));
            },
            child: Text('前往第二章界面'),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _countModel.incress();
          _favoriteModel.addHook();
        },
      ),
    );
  }
}
