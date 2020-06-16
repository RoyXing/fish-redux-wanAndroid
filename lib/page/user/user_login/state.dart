import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:flutter/material.dart';

class UserLoginState implements GlobalBaseState, Cloneable<UserLoginState> {
  TextEditingController controllerName;
  TextEditingController controllerPassword;

  @override
  UserLoginState clone() {
    return UserLoginState()..themeColor = themeColor;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

UserLoginState initState(Map<String, dynamic> args) {
  return UserLoginState()
    ..controllerName = TextEditingController()
    ..controllerPassword = TextEditingController();
}
