import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/utils/common.dart';

import 'action.dart';
import 'state.dart';

Effect<TabViewState> buildEffect() {
  return combineEffects(<Object, Effect<TabViewState>>{
    Lifecycle.initState: _init,
    TabViewAction.onRefresh: _onRefresh,
    TabViewAction.onLoadMore: _onLoadMore,
  });
}

void _init(Action action, Context<TabViewState> ctx) {
  _loadData(ctx, 1);
}

void _onRefresh(Action action, Context<TabViewState> ctx) {
  ctx.dispatch(TabViewActionCreator.updatePage(0));
  _loadData(ctx, 1);
}

void _onLoadMore(Action action, Context<TabViewState> ctx) {
  println('loadMore current page=${ctx.state.page}');
  _loadData(ctx, ctx.state.page);
}

void _loadData(Context<TabViewState> ctx, int page) async {
  List<ReposModel> reposModels;
  if (ctx.state.labelId == Constant.label_system) {
    reposModels = await WanRepository().getArticleList(page: page - 1, data: CommRequest(ctx.state.model.id));
  } else if (ctx.state.labelId == Constant.label_vx) {
    reposModels = await WanRepository().getWXArticleList(page: page, id: ctx.state.model.id);
  } else {
    reposModels = await WanRepository().getProjectList(page: page, data: CommRequest(ctx.state.model.id));
  }

  if (reposModels != null && reposModels.length > 0) {
    if (ctx.state.page == 0) {
      ctx.dispatch(TabViewActionCreator.updateData(reposModels));
      ctx.state.controller.finishRefresh(success: true);
    } else {
      var oldList = ctx.state.list;
      oldList.addAll(reposModels);
      ctx.dispatch(TabViewActionCreator.updateData(oldList));
      ctx.state.controller.finishLoad(success: true);
    }
    var page = ctx.state.page + 1;
    ctx.dispatch(TabViewActionCreator.updatePage(page));
  } else if (reposModels != null && reposModels.length == 0) {
    ctx.state.controller.finishLoad(success: true, noMore: true);
  } else {}
}
