import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

enum EventAction { onRefresh, onLoadMore, updateData, updateStatus, updatePage }

class EventActionCreator {
  static Action onRefresh() {
    return const Action(EventAction.onRefresh);
  }

  static Action onLoadMore() {
    return const Action(EventAction.onLoadMore);
  }

  static Action updateData(List<ItemState> lists) {
    return Action(EventAction.updateData, payload: lists);
  }

  static Action updateStatus(int status) {
    return Action(EventAction.updateStatus, payload: status);
  }

  static Action updatePage(int page) {
    return Action(EventAction.updatePage, payload: page);
  }
}
