import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/repos/action.dart';
import 'package:fishreduxwanandroid/widgets/scaffold_refresh.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(ReposState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter adapter = viewService.buildAdapter();
  return RefreshScaffold(
    themeColor: state.themeColor,
    labelId: I18n.of(viewService.context).recRepos,
    controller: state.controller,
    loadStatus: state.loadStatus,
    builder: adapter.itemBuilder,
    itemCount: adapter.itemCount,
    onRefresh: ({bool isReload}) async {
      dispatch(ReposActionCreator.onRefresh());
    },
    onLoadMore: () async {
      dispatch(ReposActionCreator.onLoadMore());
    },
  );
}
