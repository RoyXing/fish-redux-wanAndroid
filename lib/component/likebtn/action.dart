import 'package:fish_redux/fish_redux.dart';

enum LikeBtnAction {
  update,
  onDoAction,
  onLoginPage,
  remove,
}

class LikeBtnActionCreator {
  static Action update(int id) {
    return Action(LikeBtnAction.update, payload: id);
  }

  static Action onLoginPage() {
    return Action(LikeBtnAction.onLoginPage);
  }

  static Action onDoAction(int id) {
    return Action(LikeBtnAction.onDoAction, payload: id);
  }

  static Action remove(int id) {
    return Action(LikeBtnAction.remove, payload: id);
  }
}
