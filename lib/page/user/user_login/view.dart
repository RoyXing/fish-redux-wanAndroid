import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/user/user_login/action.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/dimens.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:fishreduxwanandroid/widgets/login_item.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(UserLoginState state, Dispatch dispatch, ViewService viewService) {
  var i18n = I18n.of(viewService.context);
  return Scaffold(
    resizeToAvoidBottomInset: false,
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
                      controller: state.controllerName,
                      prefixIcon: Icons.person,
                      hintText: i18n.user_name,
                      color: state.themeColor,
                    ),
                    LoginItem(
                      controller: state.controllerPassword,
                      prefixIcon: Icons.lock,
                      hasSuffixIcon: true,
                      hintText: i18n.user_pwd,
                      color: state.themeColor,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: Dimens.gap_dp15),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Text(
                          i18n.user_forget_pwd,
                          style: TextStyle(color: Colours.gray_99, fontSize: Dimens.font_sp14),
                        ),
                        onTap: () {
                          Utils.showSnackBar(viewService.context, "请联系管理员～");
                        },
                      ),
                    ),
                    RoundButton(
                      bgColor: state.themeColor,
                      text: i18n.user_login,
                      margin: EdgeInsets.only(top: 20),
                      onPressed: () {
                        dispatch(UserLoginActionCreator.onLogin());
                      },
                    ),
                    Gaps.vGap15,
                    InkWell(
                      onTap: () {
                        dispatch(UserLoginActionCreator.onRegister());
                      },
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              style: TextStyle(fontSize: 14, color: Colours.text_gray),
                              text: i18n.user_new_user_hint),
                          TextSpan(
                            style: new TextStyle(
                                fontSize: 14,
                                color: state.themeColor ?? Theme.of(viewService.context).primaryColor),
                            text: i18n.user_register,
                          ),
                        ]),
                      ),
                    )
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
