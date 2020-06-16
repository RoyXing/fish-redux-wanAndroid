import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/widgets/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TabViewPage extends Page<TabViewState, Map<String, dynamic>> {
  TabViewPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          wrapper: keepAliveWrapper,
          view: buildView,
          dependencies: Dependencies<TabViewState>(
            adapter: null,
            slots: <String, Dependent<TabViewState>>{},
          ),
        );
}
