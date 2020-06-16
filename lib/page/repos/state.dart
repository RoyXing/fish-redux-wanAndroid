import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ReposState extends MutableSource implements GlobalBaseState, Cloneable<ReposState> {
  List<ItemState> list = [];
  int page = 0;
  EasyRefreshController controller;
  int loadStatus;

  @override
  ReposState clone() {
    return ReposState()
      ..list = list
      ..page = page
      ..loadStatus = loadStatus
      ..themeColor = themeColor;
  }

  @override
  Object getItemData(int index) {
    return list[index]..isCollectPage = false;
  }

  @override
  String getItemType(int index) {
    return 'repos';
  }

  @override
  int get itemCount => list?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    list[index] = data;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

ReposState initState(Map<String, dynamic> args) {
  return ReposState()
    ..list = []
    ..page = 0
    ..controller = EasyRefreshController()
    ..loadStatus = LoadStatus.loading;
}
