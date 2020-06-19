import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  set themeColor(Color color);

  Locale get locale;

  set locale(Locale locale);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor = Colors.blue;

  @override
  Locale locale;

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..locale = locale;
  }
}
