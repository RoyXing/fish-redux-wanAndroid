import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/system/action.dart';
import 'package:fishreduxwanandroid/widgets/scaffold_refresh.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(SystemState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();

  return RefreshScaffold(
    themeColor: state.themeColor,
    loadStatus: state.loadStatus,
    onRefresh: ({bool isReload}) async {
      dispatch(SystemActionCreator.onRefresh());
    },
    controller: state.controller,
    labelId: I18n.of(viewService.context).titleSystem,
    builder: listAdapter.itemBuilder,
    itemCount: listAdapter.itemCount,
  );
}
