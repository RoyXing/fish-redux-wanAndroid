import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.updateBannerData: _updateBannerData,
      HomeAction.updateReposData: _updateReposData,
      HomeAction.updateWxArticleData: _updateWxArticleData,
      HomeAction.updateLoadStatus: _updateLoadStatus,
    },
  );
}

HomeState _updateBannerData(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState..bannerList = action.payload;
}

HomeState _updateReposData(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState..reposList = action.payload;
}

HomeState _updateWxArticleData(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState..wxArticleList = action.payload;
}

HomeState _updateLoadStatus(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState..loadStatus = action.payload;
}
