import 'package:fish_redux/fish_redux.dart';

enum AdapterAction { action }

class AdapterActionCreator {
  static Action action(int id) {
    return Action(AdapterAction.action,payload: id);
  }
}
