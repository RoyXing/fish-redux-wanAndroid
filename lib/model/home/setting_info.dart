import 'package:flutter/cupertino.dart';

class SettingInfo {
  String tag;
  String titleId;
  IconData iconData;
  Widget page;
  bool withScaffold;

  SettingInfo(
    this.tag,
    this.titleId,
    this.iconData,
    this.page, [
    this.withScaffold,
  ]);
}
