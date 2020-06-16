import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingState implements GlobalBaseState, Cloneable<SettingState> {
  Map<String, Color> themeColorMap;
  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  SettingState clone() {
    return SettingState()
      ..themeColorMap = themeColorMap
      ..locale = locale
      ..themeColor = themeColor;
  }
}

SettingState initState(Map<String, dynamic> args) {
  var state = SettingState();
  state.themeColorMap = Colours.themeColorMap;
  return state;
}
