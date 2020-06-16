import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/action.dart';
import 'package:fishreduxwanandroid/global/state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(<Object, Reducer<GlobalState>>{
    GlobalAction.changeThemeColor: _changeThemeColor,
    GlobalAction.changeLanguage: _changeLanguage,
  });
}

GlobalState _changeThemeColor(GlobalState state, Action action) {
  Color color = action.payload;
  println('object $color');
  return state.clone()..themeColor = color;
}

GlobalState _changeLanguage(GlobalState state, Action action) {
  Locale locale = action.payload;
  return state.clone()..locale = locale;
}
