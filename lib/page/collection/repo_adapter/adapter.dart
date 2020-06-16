import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/component.dart';
import 'package:fishreduxwanandroid/component/repos/component.dart';
import 'package:fishreduxwanandroid/page/collection/state.dart';

import 'reducer.dart';

class CollectionListAdapter extends SourceFlowAdapter<CollectionState> {
  CollectionListAdapter()
      : super(
          reducer: buildReducer(),
          pool: <String, Component<Object>>{
            'repos': RepoItemComponent(),
            'article': ArticleItemComponent(),
          },
        );
}
