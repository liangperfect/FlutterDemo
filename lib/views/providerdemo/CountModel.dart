import 'package:flutter/cupertino.dart';

class CountModel with ChangeNotifier {
  int _count = 0;

  int getCount() => _count;

  CountModel(this._count);

  void incress() {
    _count++;
    //通知绑定了CountModel的类
    notifyListeners();
  }
}
