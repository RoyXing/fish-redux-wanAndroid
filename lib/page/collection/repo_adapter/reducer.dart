import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/action.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/component/repos/action.dart';

import '../state.dart';

Reducer<CollectionState> buildReducer() {
  return asReducer(<Object, Reducer<CollectionState>>{
    ArticleItemAction.removeArticle: _remove,
    RepoItemAction.remove: _remove,
  });
}

CollectionState _remove(CollectionState state, Action action) {
  CollectionState newState = state.clone();
  ItemState model;
  for (int i = 0; i < newState.lists.length; i++) {
    int id = newState.lists[i].model.originId ?? newState.lists[i].model.id;
    if (id == action.payload) {
      model = newState.lists[i];
    }
  }
  if (model != null) newState.lists.remove(model);
  return newState;
}
