import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:library_utils/library_utils.dart';

class CollectionState extends MutableSource implements GlobalBaseState, Cloneable<CollectionState> {
  EasyRefreshController controller;
  List<ItemState> lists;
  int page;

  @override
  CollectionState clone() {
    return CollectionState()
      ..controller = controller
      ..lists = lists
      ..page = page
      ..themeColor = themeColor;
  }

  @override
  Object getItemData(int index) {
    return lists[index] ?? ItemState();
  }

  @override
  String getItemType(int index) {
    if (ObjectUtil.isNotEmpty(lists[index].model.envelopePic)) {
      return 'repos';
    } else {
      return 'article';
    }
  }

  @override
  int get itemCount => lists.length;

  @override
  void setItemData(int index, Object data) {
    lists[index] = data;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

CollectionState initState(Map<String, dynamic> args) {
  return CollectionState()
    ..controller = EasyRefreshController()
    ..page = 0
    ..lists = [];
}
