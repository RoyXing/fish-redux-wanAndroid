import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LikeBtnState state, Dispatch dispatch, ViewService viewService) {
  return InkWell(
    onTap: () {
      if (Utils.isLogin()) {
        dispatch(LikeBtnActionCreator.onDoAction(state.actuallyId));
      } else {
        dispatch(LikeBtnActionCreator.onLoginPage());
      }
    },
    child: Icon(
      Icons.favorite,
      color: (state.model.collect && Utils.isLogin() ? Colors.redAccent : Colours.gray_99),
    ),
  );
}
