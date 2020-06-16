import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/collection/action.dart';
import 'package:fishreduxwanandroid/widgets/scaffold_refresh.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(CollectionState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      elevation: 0.0,
      title: Text(I18n.of(viewService.context).titleCollection),
      centerTitle: true,
    ),
    body: RefreshScaffold(
      themeColor: state.themeColor,
      controller: state.controller,
      onLoadMore: () async {
        dispatch(CollectionActionCreator.onLoadMore());
      },
      onRefresh: ({bool isReload}) async {
        dispatch(CollectionActionCreator.onRefresh());
      },
      itemCount: adapter.itemCount,
      builder: adapter.itemBuilder,
    ),
  );
}
