import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'view_state_list_model.dart';

/// 基于
abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> {
  /// 分页第一页页码
  static const int pageNumFirst = 1;

  /// 分页条目数量
  static const int pageSize = 15;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  /// 当前页码
  int _currentPageNum = pageNumFirst;

  /// 下拉刷新
  ///
  /// [init] 是否是第一次加载
  /// true:  Error时,需要跳转页面
  /// false: Error时,不需要跳转页面,直接给出提示
  Future<List<T>> refresh({bool init = false}) async {
    print('chenliang 进行刷新');
    try {
      print('chenliang 18');
      _currentPageNum = pageNumFirst;
      print('chenliang 19');
      var data = await loadData(pageNum: pageNumFirst);
      print('chenliang 20');
      if (data.isEmpty) {
        print('chenliang 21');
        refreshController.refreshCompleted(resetFooterState: true);
        print('chenliang 22');
        list.clear();
        print('chenliang 23');
        setEmpty();
        print('chenliang 24');
      } else {
        print('chenliang 25');
        onCompleted(data);
        print('chenliang 26');
        list.clear();
        print('chenliang 27');
        list.addAll(data);
        print('chenliang 28');
        refreshController.refreshCompleted();
        print('chenliang 29');
        // 小于分页的数量,禁止上拉加载更多
        if (data.length < pageSize) {
          print('chenliang 30');
          refreshController.loadNoData();
        } else {
          //防止上次上拉加载更多失败,需要重置状态
          print('chenliang 31');
          refreshController.loadComplete();
        }
        print('chenliang 32');
        setIdle();
      }
      return data;
    } catch (e, s) {
      /// 页面已经加载了数据,如果刷新报错,不应该直接跳转错误页面
      /// 而是显示之前的页面数据.给出错误提示
      print('chenliang 70');
      if (init) list.clear();
      print('chenliang 71');
      refreshController.refreshFailed();
      print('chenliang 72');
      setError(e, s);
      return null;
    }
  }

  /// 上拉加载更多
  Future<List<T>> loadMore() async {
    try {
      var data = await loadData(pageNum: ++_currentPageNum);
      if (data.isEmpty) {
        _currentPageNum--;
        refreshController.loadNoData();
      } else {
        onCompleted(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      _currentPageNum--;
      refreshController.loadFailed();
      debugPrint('error--->\n' + e.toString());
      debugPrint('statck--->\n' + s.toString());
      return null;
    }
  }

  // 加载数据
  Future<List<T>> loadData({int pageNum});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
