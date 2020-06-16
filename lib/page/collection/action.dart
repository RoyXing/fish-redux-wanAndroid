import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';

enum CollectionAction {
  onRefresh,
  onLoadMore,
  updatePage,
  updateData,
}

class CollectionActionCreator {
  static Action onRefresh() {
    return const Action(CollectionAction.onRefresh);
  }

  static Action onLoadMore() {
    return const Action(CollectionAction.onLoadMore);
  }

  static Action updatePage(int page) {
    return Action(CollectionAction.updatePage, payload: page);
  }

  static Action updateData(List<ItemState> lists) {
    return Action(CollectionAction.updateData, payload: lists);
  }
}
