import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

enum ReposAction { onLoadMore, onRefresh, updateData, updatePage, updateStatus }

class ReposActionCreator {
  static Action onLoadMore() {
    return const Action(ReposAction.onLoadMore);
  }

  static Action onRefresh() {
    return const Action(ReposAction.onRefresh);
  }

  static Action updateData(List<ItemState> datas) {
    return Action(ReposAction.updateData, payload: datas);
  }

  static Action updatePage(int page) {
    return Action(ReposAction.updatePage, payload: page);
  }

  static Action updateStatus(int status) {
    return Action(ReposAction.updateStatus, payload: status);
  }
}
