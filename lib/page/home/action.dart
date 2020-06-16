import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/banner_model.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

enum HomeAction {
  onRefresh,
  updateBannerData,
  updateReposData,
  updateWxArticleData,
  updateLoadStatus,
}

class HomeActionCreator {
  static Action updateBannerData(List<BannerModel> datas) {
    return Action(HomeAction.updateBannerData, payload: datas);
  }

  static Action updateReposData(List<ReposModel> list) {
    return Action(HomeAction.updateReposData, payload: list);
  }

  static Action updateWxArticleData(List<ReposModel> list) {
    return Action(HomeAction.updateWxArticleData, payload: list);
  }

  static Action onRefresh() {
    return Action(HomeAction.onRefresh);
  }

  static Action updateLoadStatus(int status) {
    return Action(HomeAction.updateLoadStatus, payload: status);
  }
}
