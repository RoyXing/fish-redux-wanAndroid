import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/page/events/action.dart';
import 'package:fishreduxwanandroid/page/events/state.dart';

Reducer<EventState> buildReducer() {
  return asReducer(
    <Object, Reducer<EventState>>{
      EventAction.updateData: _updateData,
      EventAction.updateStatus: _updateStatus,
      EventAction.updatePage: _updatePage,
    },
  );
}

EventState _updateData(EventState state, Action action) {
  final EventState newState = state.clone();
  return newState..lists = action.payload;
}

EventState _updateStatus(EventState state, Action action) {
  final EventState newState = state.clone();
  return newState..loadStatus = action.payload;
}

EventState _updatePage(EventState state, Action action) {
  final EventState newState = state.clone();
  return newState..page = action.payload;
}
