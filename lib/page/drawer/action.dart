import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/setting_info.dart';

enum DrawerAction { action }

class DrawerActionCreator {
  static Action onAction(SettingInfo info) {
    return Action(DrawerAction.action, payload: info);
  }
}
