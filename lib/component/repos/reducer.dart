import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/component/likebtn/action.dart';

import 'action.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
      RepoItemAction.action: _onAction,
    },
  );
}

ItemState _onAction(ItemState state, Action action) {
  final ItemState newState = state.clone();
  return newState;
}
