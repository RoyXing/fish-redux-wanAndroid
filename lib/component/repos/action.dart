import 'package:fish_redux/fish_redux.dart';

enum RepoItemAction { action, remove }

class RepoItemActionCreator {
  static Action onAction() {
    return const Action(RepoItemAction.action);
  }

  static Action remove(int id) {
    return Action(RepoItemAction.remove, payload: id);
  }
}
