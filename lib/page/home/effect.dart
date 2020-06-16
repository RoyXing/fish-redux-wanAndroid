import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/banner_model.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.onRefresh: _onRefresh,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  _onRefresh(action, ctx);
}

void _onRefresh(Action action, Context<HomeState> ctx) {
  _getBannerData(ctx);
  _getReposData(ctx);
  _getWxArticleData(ctx);
}

void _getBannerData(Context<HomeState> ctx) async {
  List<BannerModel> bannerLists = await WanRepository().getBanner();
  if (bannerLists != null && bannerLists.length > 0) {
    ctx.dispatch(HomeActionCreator.updateBannerData(bannerLists));
    ctx.dispatch(HomeActionCreator.updateLoadStatus(LoadStatus.success));
  }
}

void _getReposData(Context<HomeState> ctx) async {
  List<ReposModel> reposModels = await WanRepository().getProjectList(data: CommRequest(402));
  if (reposModels != null && reposModels.length > 0) {
    ctx.dispatch(HomeActionCreator.updateReposData(reposModels));
    ctx.dispatch(HomeActionCreator.updateLoadStatus(LoadStatus.success));
  }
}

void _getWxArticleData(Context<HomeState> ctx) async {
  WanRepository().getWXArticleList(id: 408).then((List<ReposModel> lists) {
    if (lists.length > 6) {
      lists = lists.sublist(0, 6);
    }
    ctx.dispatch(HomeActionCreator.updateWxArticleData(lists));
    ctx.state.controller.finishRefresh();
    ctx.state.controller.finishLoad(success: true, noMore: true);
    ctx.dispatch(HomeActionCreator.updateLoadStatus(LoadStatus.success));
  });
}
