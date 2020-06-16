import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/setting/action.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:library_utils/library_utils.dart';

import 'state.dart';

Widget buildView(SettingState state, Dispatch dispatch, ViewService viewService) {
  var i18n = I18n.of(viewService.context);
  String getLocale(Locale locale) {
    if (locale.toString() == "zh_CN") {
      return '中文简体';
    } else if (locale.toString() == 'en_US') {
      return 'English';
    }
    return 'Default';
  }

  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text(i18n.titleSetting),
      centerTitle: true,
    ),
    body: ListView(
      children: <Widget>[
        ExpansionTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.color_lens,
                color: state.themeColor ?? Colours.gray_66,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(i18n.titleTheme),
              ),
            ],
          ),
          children: <Widget>[
            Wrap(
              children: state.themeColorMap.keys.map((String key) {
                Color value = state.themeColorMap[key];
                return InkWell(
                  onTap: () {
                    SpUtil.putString(Constant.key_theme_color, key);
                    dispatch(SettingActionCreator.changeThemeColor(value));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    width: 36.0,
                    height: 36.0,
                    color: value,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.language,
                color: state.themeColor ?? Colours.gray_66,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(i18n.titleLanguage),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                getLocale(state.locale),
                style: TextStyle(fontSize: 14.0, color: Colours.gray_99),
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
          onTap: () {
            dispatch(SettingActionCreator.changeLanguage());
          },
        ),
      ],
    ),
  );
}
