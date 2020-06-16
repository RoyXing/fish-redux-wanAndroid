import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';

import 'action.dart';
import 'state.dart';

Effect<LikeBtnState> buildEffect() {
  return combineEffects(<Object, Effect<LikeBtnState>>{
    LikeBtnAction.onDoAction: _onDoAction,
    LikeBtnAction.onLoginPage: _onLoginPage,
  });
}

void _onDoAction(Action action, Context<LikeBtnState> ctx) {
  var model = ctx.state.model;
  if (ctx.state.actuallyId == action.payload) {
    if (model.collect) {
      WanRepository.repository.unCollect(model.originId ?? model.id).then((value) {
        if (ctx.state.isCollectPage)
          ctx.dispatch(LikeBtnActionCreator.remove(action.payload));
        else
          ctx.dispatch(LikeBtnActionCreator.update(action.payload));
      });
    } else {
      WanRepository.repository.collect(model.originId ?? model.id).then((value) {
        ctx.dispatch(LikeBtnActionCreator.update(action.payload));
      });
    }
  }
}

void _onLoginPage(Action action, Context<LikeBtnState> ctx) {
  NavigatorUtil.pushPage(ctx.context, routes.buildPage('login', null));
}
