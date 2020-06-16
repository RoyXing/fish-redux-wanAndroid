import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/global/action.dart';
import 'package:fishreduxwanandroid/global/store.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:library_utils/library_utils.dart';
import 'dart:ui' as ui;

import 'action.dart';
import 'state.dart';

Effect<SettingState> buildEffect() {
  return combineEffects(<Object, Effect<SettingState>>{
    SettingAction.action: _onAction,
    SettingAction.changeThemeColor: _changeThemeColor,
    SettingAction.changeLanguage: _changeLanguage,
  });
}

void _onAction(Action action, Context<SettingState> ctx) {}

void _changeThemeColor(Action action, Context<SettingState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor(action.payload));
}

void _changeLanguage(Action action, Context<SettingState> ctx) async {
  var result = await showDialog(
      context: ctx.context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxHeight: 300),
                        padding: EdgeInsets.only(bottom: MediaQueryData.fromWindow(ui.window).padding.bottom),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Material(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context, "zh_CN");
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Center(
                                      child: Text('中文简体'),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: Colours.divider,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context, "en_US");
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Center(
                                      child: Text('English'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
  if (ObjectUtil.isNotEmpty(result)) {
    I18n.onLocaleChanged(Locale(result));
  }
}
