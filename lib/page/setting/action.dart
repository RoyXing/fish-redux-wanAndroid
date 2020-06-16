import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum SettingAction { action, changeThemeColor, changeLanguage }

class SettingActionCreator {
  static Action onAction() {
    return const Action(SettingAction.action);
  }

  static Action changeThemeColor(Color color) {
    return Action(SettingAction.changeThemeColor, payload: color);
  }

  static Action changeLanguage() {
    return const Action(SettingAction.changeLanguage);
  }
}
