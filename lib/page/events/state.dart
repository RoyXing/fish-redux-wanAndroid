import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EventState extends MutableSource implements GlobalBaseState, Cloneable<EventState> {
  EasyRefreshController controller;
  List<ItemState> lists;
  int loadStatus;
  int page;

  @override
  EventState clone() {
    return EventState()
      ..controller = controller
      ..lists = lists
      ..loadStatus = loadStatus
      ..page = page
      ..themeColor = themeColor;
  }

  @override
  Object getItemData(int index) {
    return lists[index]..isCollectPage = false;
  }

  @override
  String getItemType(int index) {
    return 'article';
  }

  @override
  int get itemCount => lists?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    lists[index] = data;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

EventState initState(Map<String, dynamic> args) {
  return EventState()
    ..controller = EasyRefreshController()
    ..loadStatus = LoadStatus.loading
    ..page = 0
    ..lists = [];
}
