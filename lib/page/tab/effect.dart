import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/page/tab/tabview/action.dart';
import 'package:fishreduxwanandroid/utils/common.dart';

import 'action.dart';
import 'state.dart';

Effect<TabState> buildEffect() {
  return combineEffects(<Object, Effect<TabState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<TabState> ctx) {
  _loadData(ctx);
}

void _loadData(Context<TabState> ctx) async {
  if (ctx.state.labelId == Constant.label_repos) {
    WanRepository.repository.getProjectTree().then((list) {
      if (list != null && list.length > 0) {
        ctx.dispatch(TabActionCreator.updateData(list));
      }
    }).catchError((e) {});
  } else if (ctx.state.labelId == Constant.label_vx) {
    WanRepository.repository.getWxArticleTree().then((list) {
      if (list != null && list.length > 0) {
        ctx.dispatch(TabActionCreator.updateData(list));
      }
    }).catchError((e) {});
  }
}
