import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';

//TODO replace with your own action
enum TreeItemAction { action, onTabPage }

class TreeItemActionCreator {
  static Action onAction() {
    return const Action(TreeItemAction.action);
  }

  static Action onTabPage() {
    return Action(TreeItemAction.onTabPage);
  }
}
