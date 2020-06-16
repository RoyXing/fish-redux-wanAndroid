import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';

class MainState implements GlobalBaseState, Cloneable<MainState> {
  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  MainState clone() {
    return MainState()..themeColor = themeColor;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
