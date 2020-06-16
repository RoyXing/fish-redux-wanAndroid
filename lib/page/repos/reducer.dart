import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReposState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReposState>>{
      ReposAction.updateData: _updateData,
      ReposAction.updatePage: _updatePage,
      ReposAction.updateStatus: _updateStatus,
    },
  );
}

ReposState _updatePage(ReposState state, Action action) {
  final ReposState newState = state.clone();
  return newState..page = action.payload;
}

ReposState _updateData(ReposState state, Action action) {
  final ReposState newState = state.clone();
  return newState..list = action.payload;
}

ReposState _updateStatus(ReposState state, Action action) {
  final ReposState newState = state.clone();
  return newState..loadStatus = action.payload;
}
