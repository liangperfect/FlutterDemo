import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static showSelectModelDialog(
      BuildContext context, int whichModel, Function(int) selectMethod) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        builder: (_) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 8),
                          margin: EdgeInsets.only(left: 24),
                          child: Text(
                            '筛选条件',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 8),
                          margin: EdgeInsets.only(right: 24),
                          child: InkWell(
                            child: Image.asset('assets/images/close.png'),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Color(0xFFF7F7F8),
                    )
                  ],
                ),
                selectItem('默认', whichModel == 1, selectMethod),
                selectItem('预警', whichModel == 2, selectMethod),
                selectItem('故障', whichModel == 3, selectMethod),
                selectItem('离线', whichModel == 4, selectMethod),
              ],
            ),
          );
        });
  }

  static Widget selectItem(
      String modeName, bool isChecked, Function(int) selectMethod) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(modeName,
              style: TextStyle(
                  color: !isChecked ? Colors.black : Colors.blue,
                  fontSize: 16)),
          !isChecked
              ? Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(left: 20),
                )
              : Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/images/circle1.png',
                  ))
        ],
      ),
      onTap: () {
        print('点击选择了');
        selectMethod(1);
      },
    );
  }
}
