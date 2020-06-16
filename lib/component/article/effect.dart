import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/likebtn/action.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';

import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ArticleItemAction.action: _onAction,
    LikeBtnAction.remove: _remove,
  });
}

void _onAction(Action action, Context<ItemState> ctx) {
  NavigatorUtil.pushWeb(
    ctx.context,
    title: ctx.state.model.title,
    url: ctx.state.model.link,
    model: ctx.state.model,
  );
}

void _remove(Action action, Context<ItemState> ctx) {
  ctx.dispatch(ArticleItemActionCreator.remove(action.payload));
}
