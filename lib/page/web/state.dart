import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';

class WebScaffoldState implements GlobalBaseState, Cloneable<WebScaffoldState> {
  String title;
  String titleId;
  String url;

  @override
  WebScaffoldState clone() {
    return WebScaffoldState()
      ..title = title
      ..titleId = titleId
      ..url = url
      ..themeColor = themeColor;
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
    ..url = args['url'];
}
