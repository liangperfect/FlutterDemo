import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SearchDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Scaffold(

        appBar: AppBar(
          title: Text('我是二级界面'),
          leading: Icon(Icons.account_balance),
        ),
        body: Center(
//          child: Text('我是二級界面的中心點文字'),
          child: Container(
            color: Colors.amber,
            child: Row(
              children: <Widget>[
                Text('第一個'),
                Text('第二個'),
                Text('第三個'),
                Text('第四個'),
                Column(
                  children: <Widget>[
                      Text('豎起的第一個'),
                      Text('豎起的第二個'),
                      Text('豎起的第三個'),
                      Text('豎起的第四個')
                  ],
                ),
                Container(
                  color: Colors.red,
                  child: Text('单独的一个',style: TextStyle(fontSize: 20),),
                  alignment: Alignment.bottomLeft,
                )
              ],
            ),
          ),
        ),
      );
  }
}