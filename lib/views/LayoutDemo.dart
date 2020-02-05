import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('布局练习'),
        leading: Icon(Icons.brush),
      ),
      body: RowDemo(),
    );
  }
}

class RowDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          color: Colors.amberAccent,
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
                _TextWg("第一块", Colors.red),
               _TextWg("第二块", Colors.yellow),
               _TextWg("第三块", Colors.blue),
//              _TextWg("第三块", Colors.blue),
               Card(
                 color: Colors.green,
                 child: Text('我是card里面'),
//                 shape: Border.all(color: Colors.yellow,width: 5.0),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 elevation: 20,
               ),
            ],
//            mainAxisSize: MainAxisSize.min,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl, //定义起始位置的
          ),
        ),
    );
  }

  Widget _TextWg(String txt,Color format){
      final col = format;
      final text = txt;
      return Container(
          width: 100,
          height: 100,
          color: col,
          child: Text(text),
          alignment: Alignment.center,
      );
  }
}
