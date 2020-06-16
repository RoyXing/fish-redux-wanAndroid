import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/splash/splash_model.dart';
import 'package:flutter/material.dart' hide Action;

enum SplashAction { updateSplashModel, updateStatus, updateBannerList, updateCount, onGoToMain }

class SplashActionCreator {
  static Action updateSplashModel(SplashModel model) {
    return Action(SplashAction.updateSplashModel, payload: model);
  }

  static Action updateStatus(int status) {
    return Action(SplashAction.updateStatus, payload: status);
  }

  static Action updateBannerList(List<Widget> bannerList) {
    return Action(SplashAction.updateBannerList, payload: bannerList);
  }

  static Action updateCount(int count) {
    return Action(SplashAction.updateCount, payload: count);
  }

  static Action onGoToMain() {
    return Action(SplashAction.onGoToMain);
  }
}
