import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/user/user_model.dart';
import 'package:fishreduxwanandroid/network/wan_repository.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:library_utils/util/sp_util.dart';
import 'action.dart';
import 'state.dart';

Effect<UserRegisterState> buildEffect() {
  return combineEffects(<Object, Effect<UserRegisterState>>{
    UserRegisterAction.onRegister: _onRegister,
  });
}

void _onRegister(Action action, Context<UserRegisterState> ctx) {
  String userName = ctx.state.controllerName.text.trim();
  String password = ctx.state.controllerPassword.text.trim();
  String passwordConfirm = ctx.state.controllerPassword.text.trim();
  if (userName.isEmpty || userName.length < 6) {
    Utils.showSnackBar(ctx.context, userName.isEmpty ? "请输入用户名～" : "用户名至少6位～");
    return;
  }

  if (password.isEmpty || password.length < 6) {
    Utils.showSnackBar(ctx.context, password.isEmpty ? "请输入密码～" : "密码至少6位～");
    return;
  }

  if (passwordConfirm.isEmpty || passwordConfirm.length < 6) {
    Utils.showSnackBar(ctx.context, passwordConfirm.isEmpty ? "请重新输入密码～" : "密码至少6位～");
    return;
  }
  if (passwordConfirm != password) {
    Utils.showSnackBar(ctx.context, "两次密码输入不一致，请重新输入");
    ctx.state.controllerPassword.clear();
    ctx.state.controllerPasswordConfirm.clear();
    return;
  }

  WanRepository.repository.register(RegisterReq(userName, password, passwordConfirm)).then((UserModel model) {
    Utils.showSnackBar(ctx.context, "注册成功～");
    SpUtil.putObject(Constant.keyUserModel, model);
    NavigatorUtil.replacementPage(ctx.context, routes.buildPage('main', null));
  }).catchError((e) {
    Utils.showSnackBar(ctx.context, e.toString());
  });
}
