import 'package:fish_redux/fish_redux.dart';

enum UserRegisterAction { onRegister }

class UserRegisterActionCreator {
  static Action onRegister() {
    return const Action(UserRegisterAction.onRegister);
  }
}
