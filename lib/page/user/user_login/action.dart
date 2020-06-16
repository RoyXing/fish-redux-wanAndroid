import 'package:fish_redux/fish_redux.dart';

enum UserLoginAction { onLogin, onRegister }

class UserLoginActionCreator {

  static Action onLogin() {
    return const Action(UserLoginAction.onLogin);
  }

  static Action onRegister() {
    return const Action(UserLoginAction.onRegister);
  }
}
