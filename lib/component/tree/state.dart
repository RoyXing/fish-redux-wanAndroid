import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';

class TreeItemState implements Cloneable<TreeItemState> {
  TreeModel treeModel;

  @override
  TreeItemState clone() {
    return TreeItemState()..treeModel = treeModel;
  }
}

TreeItemState initState(Map<String, dynamic> args) {
  return TreeItemState();
}
