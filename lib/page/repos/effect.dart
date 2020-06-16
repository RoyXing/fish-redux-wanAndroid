import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/utils/common.dart';

import 'action.dart';
import 'state.dart';

Effect<ReposState> buildEffect() {
  return combineEffects(<Object, Effect<ReposState>>{
    Lifecycle.initState: _init,
    ReposAction.onRefresh: _onRefresh,
    ReposAction.onLoadMore: _onLoadMore,
  });
}

void _init(Action action, Context<ReposState> ctx) {
  _onRefresh(action, ctx);
}

Future _loadData(Context<ReposState> ctx, int page) async {
  WanRepository.repository.getArticleListProject(page).then((lists) {
    ctx.dispatch(ReposActionCreator.updateStatus(LoadStatus.success));
    if (lists.length > 0) {
      List<ItemState> itemList = [];
      lists.forEach((element) {
        itemList.add(ItemState(model: element));
      });

      if (page == 0) {
        ctx.dispatch(ReposActionCreator.updateData(itemList));
      } else {
        var newData = ctx.state.list;
        newData.addAll(itemList);
        ctx.dispatch(ReposActionCreator.updateData(newData));
      }
      ctx.dispatch(ReposActionCreator.updatePage(ctx.state.page + 1));
    } else {
      ctx.state.controller.finishLoad(noMore: true, success: true);
    }
  }).catchError((e) {
    ctx.dispatch(ReposActionCreator.updateStatus(LoadStatus.fail));
  });
}

void _onRefresh(Action action, Context<ReposState> ctx) async {
  ctx.dispatch(ReposActionCreator.updatePage(0));
  await _loadData(ctx, 0);
  ctx.state.controller?.finishRefresh();
}

void _onLoadMore(Action action, Context<ReposState> ctx) {
  _loadData(ctx, ctx.state.page);
}
