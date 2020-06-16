import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/state.dart';
import 'package:fishreduxwanandroid/component/likebtn/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class RepoItemComponent extends Component<ItemState> {
  static final String path = "repo_item_component";

  RepoItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ItemState>(
            adapter: null,
            slots: <String, Dependent<ItemState>>{
              LikeBtnComponent.path: ItemLikeConnector() + LikeBtnComponent(),
            },
          ),
        );
}
