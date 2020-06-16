import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/likebtn/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ArticleItemComponent extends Component<ItemState> {
  static final String path = "article_item_component";

  ArticleItemComponent()
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
