import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/page/events/action.dart';
import 'package:fishreduxwanandroid/page/events/state.dart';
import 'package:fishreduxwanandroid/utils/common.dart';

Effect<EventState> buildEffect() {
  return combineEffects(<Object, Effect<EventState>>{
    Lifecycle.initState: _init,
    EventAction.onRefresh: _onRefresh,
    EventAction.onLoadMore: _onLoadMore,
  });
}

void _init(Action action, Context<EventState> ctx) {
  _loadData(ctx, 0);
}

void _onRefresh(Action action, Context<EventState> ctx) {
  ctx.dispatch(EventActionCreator.updatePage(0));
  _loadData(ctx, 0);
}

void _onLoadMore(Action action, Context<EventState> ctx) {
  _loadData(ctx, ctx.state.page);
}

void _loadData(Context<EventState> ctx, int page) {
  WanRepository.repository.getArticleList(page: page).then((lists) {
    ctx.dispatch(EventActionCreator.updateStatus(LoadStatus.success));
    if (lists.length > 0) {
      List<ItemState> itemList = [];
      lists.forEach((element) {
        itemList.add(ItemState(model: element));
      });
      if (page == 0) {
        ctx.dispatch(EventActionCreator.updateData(itemList));
      } else {
        var newData = ctx.state.lists;
        newData.addAll(itemList);
        ctx.dispatch(EventActionCreator.updateData(newData));
      }

      ctx.dispatch(EventActionCreator.updatePage(ctx.state.page + 1));
    } else {
      ctx.state.controller.finishLoad(noMore: true, success: true);
    }
  }).catchError((e) {
    ctx.dispatch(EventActionCreator.updateStatus(LoadStatus.fail));
  });
}
