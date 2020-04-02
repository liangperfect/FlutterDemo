import 'package:flutter/cupertino.dart';

class FavoriteModel with ChangeNotifier {
  int hook = 0;

  FavoriteModel(this.hook);

  int getHook() => hook;

  void addHook() {
    hook++;
  }
}
