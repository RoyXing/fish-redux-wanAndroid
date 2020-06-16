import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/tab/tabview/action.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/widgets/article_item.dart';
import 'package:fishreduxwanandroid/widgets/repos_item.dart';
import 'package:fishreduxwanandroid/widgets/scaffold_refresh.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(TabViewState state, Dispatch dispatch, ViewService viewService) {
  return RefreshScaffold(
    themeColor: state.themeColor,
    labelId: state.labelId,
    controller: state.controller,
    onRefresh: ({bool isReload}) async {
      dispatch(TabViewActionCreator.onRefresh());
    },
    onLoadMore: () async {
      dispatch(TabViewActionCreator.onLoadMore());
    },
    builder: (context, index) {
      if (state.labelId == Constant.label_repos) {
        return ReposItem(state.list[index]);
      } else {
        return ArticleItem(state.list[index]);
      }
    },
    itemCount: state.list.length,
  );
}
