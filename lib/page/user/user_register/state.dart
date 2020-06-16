import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:flutter/material.dart';

class UserRegisterState implements GlobalBaseState, Cloneable<UserRegisterState> {
  TextEditingController controllerName;
  TextEditingController controllerPassword;
  TextEditingController controllerPasswordConfirm;

  @override
  UserRegisterState clone() {
    return UserRegisterState()
      ..controllerName = controllerName
      ..controllerPassword = controllerPassword
      ..controllerPasswordConfirm = controllerPasswordConfirm
      ..themeColor = themeColor;
  }

  @override
  Locale locale;

  @override
  Color themeColor;
}

UserRegisterState initState(Map<String, dynamic> args) {
  return UserRegisterState()
    ..controllerName = TextEditingController()
    ..controllerPassword = TextEditingController()
    ..controllerPasswordConfirm = TextEditingController();
}
