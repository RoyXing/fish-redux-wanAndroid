import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LikeBtnState> buildReducer() {
  return asReducer(
    <Object, Reducer<LikeBtnState>>{
      LikeBtnAction.update: _update,
    },
  );
}

LikeBtnState _update(LikeBtnState state, Action action) {
  if (state.actuallyId == action.payload) {
    bool isLike = !state.model.collect;
    final LikeBtnState newState = state.clone();
    newState.model.collect = isLike;
    return newState..model.collect = isLike;
  }
  return state;
}
