import 'package:fish_redux/fish_redux.dart';

enum ArticleItemAction { action, removeArticle, refresh }

class ArticleItemActionCreator {
  static Action onAction() {
    return const Action(ArticleItemAction.action);
  }

  static Action refresh(bool isCollect) {
    return  Action(ArticleItemAction.refresh,payload: isCollect);
  }

  static Action remove(int id) {
    return Action(ArticleItemAction.removeArticle, payload: id);
  }
}
