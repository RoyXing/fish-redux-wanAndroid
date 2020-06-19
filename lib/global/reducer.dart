import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/config/global.dart';
import 'package:fishreduxwanandroid/global/action.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:flutter/material.dart' hide Action;

Reducer<GlobalState> buildReducer() {
  return asReducer(<Object, Reducer<GlobalState>>{
    GlobalAction.changeThemeColor: _changeThemeColor,
    GlobalAction.changeLanguage: _changeLanguage,
  });
}

GlobalState _changeThemeColor(GlobalState state, Action action) {
  Color color = action.payload;
  Global.streamController.sink.add(color);
  return state.clone()..themeColor = color;
}

GlobalState _changeLanguage(GlobalState state, Action action) {
  Locale locale = action.payload;
  return state.clone()..locale = locale;
}
