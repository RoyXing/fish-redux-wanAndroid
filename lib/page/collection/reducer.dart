import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/action.dart';
import 'package:fishreduxwanandroid/component/repos/action.dart';

import 'action.dart';
import 'state.dart';

Reducer<CollectionState> buildReducer() {
  return asReducer(
    <Object, Reducer<CollectionState>>{
      CollectionAction.updatePage: _updatePage,
      CollectionAction.updateData: _updateData,
    },
  );
}

CollectionState _updatePage(CollectionState state, Action action) {
  final CollectionState newState = state.clone();
  return newState..page = action.payload;
}

CollectionState _updateData(CollectionState state, Action action) {
  final CollectionState newState = state.clone();
  newState..lists = action.payload;
  return newState;
}