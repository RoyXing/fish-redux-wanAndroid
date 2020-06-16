import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/banner_model.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomeState implements GlobalBaseState, Cloneable<HomeState> {
  String labelId;
  List<BannerModel> bannerList;
  List<ReposModel> reposList;
  List<ReposModel> wxArticleList;
  EasyRefreshController controller;
  GlobalKey globalKey;
  int loadStatus;

  @override
  HomeState clone() {
    return HomeState()
      ..labelId = labelId
      ..bannerList = bannerList
      ..reposList = reposList
      ..wxArticleList = wxArticleList
      ..controller = controller
      ..globalKey = globalKey
      ..themeColor = themeColor
      ..loadStatus = loadStatus;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..controller = EasyRefreshController()
    ..globalKey = GlobalKey()
    ..loadStatus = LoadStatus.loading;
}
