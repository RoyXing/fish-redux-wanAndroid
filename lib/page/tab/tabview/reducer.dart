import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TabViewState> buildReducer() {
  return asReducer(
    <Object, Reducer<TabViewState>>{
      TabViewAction.updateData: _updateData,
      TabViewAction.updatePage: _updatePage,
    },
  );
}

TabViewState _updateData(TabViewState state, Action action) {
  final TabViewState newState = state.clone();
  return newState..list = action.payload;
}

TabViewState _updatePage(TabViewState state, Action action) {
  final TabViewState newState = state.clone();
  print('update page ${action.payload}');
  return newState..page = action.payload;
}
