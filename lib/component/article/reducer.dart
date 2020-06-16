import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
      ArticleItemAction.refresh: _refresh,
    },
  );
}

ItemState _refresh(ItemState state, Action action) {
  final ItemState newState = state.clone();
  newState.model.collect = action.payload;
  return newState;
}
