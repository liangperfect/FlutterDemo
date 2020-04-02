import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/providerdemo/CountModel.dart';
import 'package:flutter_app/views/providerdemo/FavoriteModel.dart';
import 'package:provider/provider.dart';

class CountPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二章界面的Count'),
      ),
      body: Consumer2<CountModel, FavoriteModel>(
        builder:
            (context, CountModel countModel, FavoriteModel favoriteModel, _) {
          return Center(
//              child: Text('第二张界面的Count${model.getCount()}'),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('第二张界面获取到的值${countModel.getCount()}'),
              Text('第二張界面的值:${favoriteModel.getHook()}')
            ],
          ));
        },
      ),
      floatingActionButton: Consumer2<CountModel, FavoriteModel>(
        builder: (BuildContext context, CountModel countModel,
            FavoriteModel favoriteModel, Widget child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              countModel.incress();
              favoriteModel.addHook();
            },
          );
        },
      ),
    );
  }
}
