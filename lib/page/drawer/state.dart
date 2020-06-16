import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';

class DrawerState implements GlobalBaseState, Cloneable<DrawerState> {
  @override
  DrawerState clone() {
    return DrawerState()..themeColor = themeColor;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

DrawerState initState(Map<String, dynamic> args) {
  return DrawerState();
}
