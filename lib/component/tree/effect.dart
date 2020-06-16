import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'action.dart';
import 'state.dart';

Effect<TreeItemState> buildEffect() {
  return combineEffects(<Object, Effect<TreeItemState>>{
    TreeItemAction.action: _onAction,
    TreeItemAction.onTabPage: _onTabPage,
  });
}

void _onAction(Action action, Context<TreeItemState> ctx) {}

void _onTabPage(Action action, Context<TreeItemState> ctx) {
  TreeModel model = ctx.state.treeModel;
  NavigatorUtil.pushTabPage(
    ctx.context,
    title: model.name,
    labelId: Constant.label_system,
    treeModel: model,
  );
}
