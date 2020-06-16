import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SystemState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemState>>{
      SystemAction.updateData: _updateData,
      SystemAction.updateStatus: _updateStatus,
    },
  );
}

SystemState _updateData(SystemState state, Action action) {
  final SystemState newState = state.clone();
  return newState..list = action.payload;
}

SystemState _updateStatus(SystemState state, Action action) {
  final SystemState newState = state.clone();
  return newState..loadStatus = action.payload;
}
