import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/page/tab/tabview/state.dart';

class TabState implements GlobalBaseState, Cloneable<TabState> {
  String title;
  TreeModel model;
  String labelId;
  String titleId;
  List<TreeModel> lists;

  @override
  TabState clone() {
    return TabState()
      ..title = title
      ..labelId = labelId
      ..model = model
      ..titleId = titleId
      ..lists = lists
      ..themeColor = themeColor;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

TabState initState(Map<String, dynamic> args) {
  return TabState()
    ..title = args["title"]
    ..labelId = args['labelId']
    ..model = args['model']
    ..titleId = args['titleId']
    ..lists = [];
}
