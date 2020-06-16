import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'action.dart';
import 'state.dart';

Effect<CollectionState> buildEffect() {
  return combineEffects(<Object, Effect<CollectionState>>{
    CollectionAction.onRefresh: _onRefresh,
    CollectionAction.onLoadMore: _onLoadMore,
    Lifecycle.initState: _init,
  });
}

void _onRefresh(Action action, Context<CollectionState> ctx) {
  ctx.dispatch(CollectionActionCreator.updatePage(0));
  _loadData(ctx, 0);
}

void _onLoadMore(Action action, Context<CollectionState> ctx) {
  _loadData(ctx, ctx.state.page);
}

void _init(Action action, Context<CollectionState> ctx) {
  _loadData(ctx, 0);
}

void _loadData(Context<CollectionState> ctx, int page) async {
  var list = await WanRepository.repository.getCollectList(page);
  if (list.length > 0) {
    List<ItemState> itemList = [];
    list.forEach((element) {
      itemList.add(ItemState(model: element..collect = true, isCollectPage: true));
    });
    println('$itemList');
    if (page == 0) {
      ctx.dispatch(CollectionActionCreator.updateData(itemList));
    } else {
      ctx.dispatch(CollectionActionCreator.updateData(ctx.state.lists..addAll(itemList)));
    }
    ctx.dispatch(CollectionActionCreator.updatePage(ctx.state.page + 1));
    ctx.state.controller.finishLoad(success: true);
  } else {
    ctx.state.controller.finishLoad(success: true, noMore: true);
  }
}
