import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

enum TabViewAction { updateData, onRefresh, onLoadMore, updatePage }

class TabViewActionCreator {
  static Action updateData(List<ReposModel> list) {
    return Action(TabViewAction.updateData, payload: list);
  }

  static Action onRefresh() {
    return const Action(TabViewAction.onRefresh);
  }

  static Action onLoadMore() {
    return const Action(TabViewAction.onLoadMore);
  }

  static Action updatePage(int page) {
    return Action(TabViewAction.updatePage, payload: page);
  }
}
