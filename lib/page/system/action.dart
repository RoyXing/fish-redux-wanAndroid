import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/tree/state.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';

enum SystemAction { updateData, onRefresh, updateStatus }

class SystemActionCreator {
  static Action onRefresh() {
    return const Action(SystemAction.onRefresh);
  }

  static Action updateData(List<TreeItemState> list) {
    return Action(SystemAction.updateData, payload: list);
  }

  static Action updateStatus(int status) {
    return Action(SystemAction.updateStatus, payload: status);
  }
}
