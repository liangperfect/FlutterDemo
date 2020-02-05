import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  //全部界面都会用到的计数count
  int _count = 0;

  get count => _count;

  void increment() {
    _count += 1;
    //通知所有用到CountModel的页面count已经更新，可以用最新的数据了
    notifyListeners();
  }

  CountModel of(context) =>
      ScopedModel.of<CountModel>(context);
}
