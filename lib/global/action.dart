import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor, changeLanguage }

class GlobalActionCreator {
  static Action changeThemeColor(Color color) {
    return Action(GlobalAction.changeThemeColor, payload: color);
  }

  static Action changeLanguage(Locale locale) {
    return Action(GlobalAction.changeLanguage, payload: locale);
  }
}
