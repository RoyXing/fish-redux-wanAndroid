import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/widgets/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TabPage extends Page<TabState, Map<String, dynamic>> {
  TabPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          wrapper: keepAliveWrapper,
          dependencies: Dependencies<TabState>(adapter: null, slots: <String, Dependent<TabState>>{}),
          middleware: <Middleware<TabState>>[],
        );
}
