import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/splash/splash_model.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class SplashState implements Cloneable<SplashState> {
  List guideList;
  int status;
  int count;
  List<Widget> bannerList;
  SplashModel splashModel;

  @override
  SplashState clone() {
    return SplashState()
      ..guideList = guideList
      ..status = status
      ..count = count
      ..splashModel = splashModel
      ..bannerList = bannerList;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState()
    ..guideList = [
      Utils.getImgPath('guide1'),
      Utils.getImgPath('guide2'),
      Utils.getImgPath('guide3'),
      Utils.getImgPath('guide4'),
    ]
    ..status = 0
    ..count = 3;
}
