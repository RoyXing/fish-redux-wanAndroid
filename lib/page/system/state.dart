import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SystemState implements GlobalBaseState, Cloneable<SystemState> {
  EasyRefreshController controller;
  List<TreeModel> list;
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
}

SystemState initState(Map<String, dynamic> args) {
  return SystemState()
    ..list = []
    ..controller = EasyRefreshController()
    ..loadStatus = LoadStatus.loading;
}
