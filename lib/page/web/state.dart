import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/likebtn/state.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

class WebScaffoldState implements GlobalBaseState, Cloneable<WebScaffoldState> {
  String title;
  String titleId;
  String url;

  ReposModel model;

  @override
  WebScaffoldState clone() {
    return WebScaffoldState()
      ..title = title
      ..titleId = titleId
      ..url = url
      ..themeColor = themeColor
      ..model = model;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

WebScaffoldState initState(Map<String, dynamic> args) {
  return WebScaffoldState()
    ..title = args['title']
    ..titleId = args['titleId']
    ..url = args['url']
    ..model = args['model'] ?? null;
}

class LikeBtnConnector extends ConnOp<WebScaffoldState, LikeBtnState> {
  @override
  void set(WebScaffoldState state, LikeBtnState subState) {
    state.model..collect = subState.model.collect;
  }

  @override
  LikeBtnState get(WebScaffoldState state) {
    return LikeBtnState()
      ..model = state.model
      ..isCollectPage = false;
  }
}
