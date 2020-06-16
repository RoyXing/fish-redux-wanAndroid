import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/widgets/login_item.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserRegisterState state, Dispatch dispatch, ViewService viewService) {
  var i18n = I18n.of(viewService.context);
  return Scaffold(
    resizeToAvoidBottomPadding: false,
    body: Stack(
      children: <Widget>[
        Image.asset(
          'packages/fishreduxwanandroid/images/ic_login_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Column(
                  children: <Widget>[
                    LoginItem(
                      color: state.themeColor,
                      controller: state.controllerName,
                      prefixIcon: Icons.person,
                      hintText: i18n.user_name,
                    ),
                    LoginItem(
                      color: state.themeColor,
                      controller: state.controllerPassword,
                      prefixIcon: Icons.lock,
                      hasSuffixIcon: true,
                      hintText: i18n.user_pwd,
                    ),
                    LoginItem(
                      color: state.themeColor,
                      controller: state.controllerPasswordConfirm,
                      prefixIcon: Icons.lock,
                      hasSuffixIcon: true,
                      hintText: i18n.user_re_pwd,
                    ),
                    RoundButton(
                      bgColor: state.themeColor,
                      text: i18n.user_register,
                      margin: EdgeInsets.only(top: 20),
                      onPressed: () {
                        dispatch(UserRegisterActionCreator.onRegister());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
