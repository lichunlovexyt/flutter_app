import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'base_model.dart';

abstract class BaseObjectModel<T> extends BaseModel {
  EasyRefreshController _easyRefreshController = EasyRefreshController();

  EasyRefreshController get easyRefreshController => _easyRefreshController;

  int pageNumber = 0;
  int pageSize = 10;

  initData() async {
    setBusy();
    await refresh(init: true);
  }

  T bean;

  /// 下拉刷新
  /// [init] 是否是第一次加载
  /// true:  Error时,需要跳转页面
  /// false: Error时,不需要跳转页面,直接给出提示
  Future<T> refresh({bool init = false}) async {
    try {
      pageNumber = 0;
      var res = await loadData();
      if (res == null) {
        easyRefreshController.resetLoadState();
        easyRefreshController.finishRefresh();
        setEmpty();
      } else {
        bean = res;
        onCompleted(res);
        easyRefreshController.resetLoadState();
        easyRefreshController.finishRefresh();
        setIdle();
      }
      notifyListeners();
      onDone(res);
      return res;
    } catch (e, s) {
      /// 页面已经加载了数据,如果刷新报错,不应该直接跳转错误页面
      /// 而是显示之前的页面数据.给出错误提示
      if (init) bean = null;
      setError(e, s);
      easyRefreshController.resetLoadState();
      easyRefreshController.finishRefresh(success: false);
      return null;
    }
  }

  /// 上拉加载更多
  Future<T> loadMore() async {
    try {
      pageNumber = pageNumber + 1;
      var res = await loadData();
      onLoadDone(res);
      notifyListeners();
      return res;
    } catch (e, s) {
      pageNumber = pageNumber - 1;
      easyRefreshController.finishLoad(success: false);
      setError(e, s);
      return null;
    }
  }

  // 加载数据
  Future<T> loadData();

  String getKey() {
    return '';
  }

  onLoadDone(T data) {}

  onCompleted(T data) {}

  onDone(T data) {}

  @override
  void dispose() {
    easyRefreshController?.dispose();

    super.dispose();
  }
}
