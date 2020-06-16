import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/model/home/setting_info.dart';
import 'package:fishreduxwanandroid/model/user/user_model.dart';
import 'package:fishreduxwanandroid/page/drawer/action.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:library_utils/library_utils.dart';

import 'state.dart';

Widget buildView(DrawerState state, Dispatch dispatch, ViewService viewService) {
  var i18n = I18n.of(viewService.context);
  List<SettingInfo> list = [];
  list.add(SettingInfo('collection', i18n.titleCollection, Icons.collections, null));
  list.add(SettingInfo('setting', i18n.titleSetting, Icons.settings, null));
  list.add(SettingInfo('about', i18n.titleAbout, Icons.info, null));
  list.add(SettingInfo('share', i18n.titleShare, Icons.share, null));

  String _userName = 'Unknown';
  if (Utils.isLogin()) {
    list.add(SettingInfo('logout', i18n.titleSignOut, Icons.power_settings_new, null));

    UserModel userModel = SpUtil.getObj(Constant.keyUserModel, (json) {
      return UserModel.fromJson(json);
    });
    _userName = userModel?.username ?? "";
  }

  return Scaffold(
    body: Column(
      children: <Widget>[
        Container(
          height: 166.0,
          width: double.infinity,
          color: state.themeColor,
          padding: EdgeInsets.only(left: 10),
          child: Center(
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64.0,
                      height: 64.0,
                      margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                Utils.getImgPath('ali_connors'),
                              ))),
                    ),
                    Text(
                      _userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.vGap5,
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemBuilder: (context, index) {
              SettingInfo info = list[index];
              return ListTile(
                leading: Icon(info.iconData),
                title: Text(info.titleId),
                onTap: () {
                  dispatch(DrawerActionCreator.onAction(info));
                },
              );
            },
            itemCount: list.length,
          ),
        )
      ],
    ),
  );
}
