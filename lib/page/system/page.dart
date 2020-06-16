import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/page/system/adapter/adapte.dart';
import 'package:fishreduxwanandroid/widgets/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SystemPage extends Page<SystemState, Map<String, dynamic>> {
  SystemPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          wrapper: keepAliveWrapper,
          dependencies: Dependencies<SystemState>(
            adapter: NoneConn<SystemState>() + SystemItemAdapter(),
            slots: <String, Dependent<SystemState>>{},
          ),
          middleware: <Middleware<SystemState>>[],
        );
}
