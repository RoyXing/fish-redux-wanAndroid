import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class TabViewState implements GlobalBaseState, Cloneable<TabViewState> {
  List<ReposModel> list;
  TreeModel model;
  String labelId;
  EasyRefreshController controller;
  int page;

  @override
  TabViewState clone() {
    return TabViewState()
      ..labelId = labelId
      ..model = model
      ..list = list
      ..controller = controller
      ..page = page
      ..themeColor = themeColor;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

TabViewState initState(Map<String, dynamic> args) {
  println('TabViewState ${args['model']} ${args['labelId']} ');
  return TabViewState()
    ..model = args['model']
    ..labelId = args['labelId']
    ..controller = EasyRefreshController()
    ..list = []
    ..page = 1;
}
