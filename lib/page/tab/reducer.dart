import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TabState> buildReducer() {
  return asReducer(
    <Object, Reducer<TabState>>{
      TabAction.updateData: _updateData,
    },
  );
}

TabState _updateData(TabState state, Action action) {
  final TabState newState = state.clone();
  return newState..lists = action.payload;
}
