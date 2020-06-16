import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/model/home/setting_info.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:library_utils/library_utils.dart';

import 'action.dart';
import 'state.dart';

Effect<DrawerState> buildEffect() {
  return combineEffects(<Object, Effect<DrawerState>>{
    DrawerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DrawerState> ctx) {
  SettingInfo info = action.payload;
  switch (info.tag) {
    case 'collection':
      if (Utils.isLogin()) {
        NavigatorUtil.pushPage(ctx.context, routes.buildPage('collection', null));
      } else {
        NavigatorUtil.pushPage(ctx.context, routes.buildPage('login', null));
      }
      break;
    case 'setting':
      NavigatorUtil.pushPage(ctx.context, routes.buildPage('setting', null));
      break;
    case 'about':
      break;
    case 'share':
      break;
    case 'logout':
      _logout(ctx);
      break;
  }
}

void _logout(Context<DrawerState> ctx) {
  showDialog(
      context: ctx.context,
      builder: (context) {
        return AlertDialog(
          content: Text('确定退出吗?'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                I18n.of(ctx.context).cancel,
                style: TextStyles.listExtra2,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                I18n.of(ctx.context).confirm,
                style: TextStyles.listExtra,
              ),
              onPressed: () {
                SpUtil.remove(Constant.keyAppToken);

                Navigator.pop(context);
                Navigator.pop(ctx.context);
              },
            ),
          ],
        );
      });
}
