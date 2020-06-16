import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/page/collection/repo_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CollectionPage extends Page<CollectionState, Map<String, dynamic>> {
  CollectionPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CollectionState>(
            adapter: NoneConn<CollectionState>() + CollectionListAdapter(),
            slots: <String, Dependent<CollectionState>>{},
          ),
        );
}
