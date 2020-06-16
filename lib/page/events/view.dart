import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/events/action.dart';
import 'package:fishreduxwanandroid/page/events/state.dart';
import 'package:fishreduxwanandroid/widgets/scaffold_refresh.dart';
import 'package:flutter/material.dart';

Widget buildView(EventState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter adapter = viewService.buildAdapter();
  return RefreshScaffold(
    loadStatus: state.loadStatus,
    themeColor: state.themeColor,
    controller: state.controller,
    labelId: I18n.of(viewService.context).titleEvents,
    onRefresh: ({bool isReload}) async {
      dispatch(EventActionCreator.onRefresh());
    },
    onLoadMore: () async {
      dispatch(EventActionCreator.onLoadMore());
    },
    builder: adapter.itemBuilder,
    itemCount: adapter.itemCount,
  );
}
