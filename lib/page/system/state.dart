import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/tree/state.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SystemState extends MutableSource implements GlobalBaseState, Cloneable<SystemState> {
  EasyRefreshController controller;
  List<TreeItemState> list;
  int loadStatus;

  @override
  SystemState clone() {
    return SystemState()
      ..controller = controller
      ..list = list
      ..loadStatus = loadStatus
      ..themeColor = themeColor;
  }

  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  Object getItemData(int index) {
    return list[index];
  }

  @override
  String getItemType(int index) {
    return 'system';
  }

  @override
  int get itemCount => list?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    list[index] = data;
  }
}

SystemState initState(Map<String, dynamic> args) {
  return SystemState()
    ..list = []
    ..controller = EasyRefreshController()
    ..loadStatus = LoadStatus.loading;
}
