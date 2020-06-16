import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/page/repos/adapter/adapter.dart';
import 'package:fishreduxwanandroid/widgets/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReposPage extends Page<ReposState, Map<String, dynamic>> {
  ReposPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          wrapper: keepAliveWrapper,
          dependencies: Dependencies<ReposState>(
            adapter: NoneConn<ReposState>() + ReposAdapter(),
            slots: <String, Dependent<ReposState>>{},
          ),
          middleware: <Middleware<ReposState>>[],
        );
}
