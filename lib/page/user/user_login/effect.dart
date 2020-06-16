import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/user/user_model.dart';
import 'package:fishreduxwanandroid/network/apis.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:library_utils/library_utils.dart';
import 'action.dart';
import 'state.dart';

Effect<UserLoginState> buildEffect() {
  return combineEffects(<Object, Effect<UserLoginState>>{
    UserLoginAction.onLogin: _onLogin,
    UserLoginAction.onRegister: _onRegister,
  });
}

void _onLogin(Action action, Context<UserLoginState> ctx) {
  String userName = ctx.state.controllerName.text.trim();
  String password = ctx.state.controllerPassword.text.trim();
  if (userName.isEmpty || userName.length < 6) {
    Utils.showSnackBar(ctx.context, userName.isEmpty ? "请输入用户名～" : "用户名至少6位～");
    return;
  }

  if (password.isEmpty || password.length < 6) {
    Utils.showSnackBar(ctx.context, password.isEmpty ? "请输入密码～" : "密码至少6位～");
    return;
  }

  WanRepository.repository.login(LoginRequest(userName, password)).then((UserModel model) {
    Utils.showSnackBar(ctx.context, "登录成功～");
    SpUtil.putObject(Constant.keyUserModel, model);
    NavigatorUtil.replacementPage(ctx.context, routes.buildPage('main', null));
  }).catchError((e) {
    Utils.showSnackBar(ctx.context, e.toString());
  });
}

void _onRegister(Action action, Context<UserLoginState> ctx) {
  NavigatorUtil.replacementPage(ctx.context, routes.buildPage('register', null));
}
