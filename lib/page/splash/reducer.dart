import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/splash/splash_model.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.updateSplashModel: _onAction,
      SplashAction.updateCount: _updateCount,
      SplashAction.updateStatus: _updateStatus,
      SplashAction.updateBannerList: _updateBannerList,
    },
  );
}

SplashState _onAction(SplashState state, Action action) {
  SplashModel splashModel = action.payload;
  final SplashState newState = state.clone();
  return newState..splashModel = splashModel;
}

SplashState _updateCount(SplashState state, Action action) {
  int count = action.payload;
  final SplashState newState = state.clone();
  return newState..count = count;
}

SplashState _updateStatus(SplashState state, Action action) {
  int status = action.payload;
  final SplashState newState = state.clone();
  return newState..status = status;
}

SplashState _updateBannerList(SplashState state, Action action) {
  List<Widget> bannerList = action.payload;
  final SplashState newState = state.clone();
  return newState..bannerList = bannerList;
}
