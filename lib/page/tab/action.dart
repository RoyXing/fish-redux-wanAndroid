import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';

enum TabAction { updateData }

class TabActionCreator {
  static Action updateData(List<TreeModel> list) {
    return Action(TabAction.updateData, payload: list);
  }
}
