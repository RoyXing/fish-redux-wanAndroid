import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/page/events/adapter/adapter.dart';
import 'package:fishreduxwanandroid/page/events/state.dart';
import 'package:fishreduxwanandroid/widgets/keep_alive.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class EventPage extends Page<EventState, Map<String, dynamic>> {
  EventPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          wrapper: keepAliveWrapper,
          dependencies: Dependencies<EventState>(
            adapter: NoneConn<EventState>() + EventAdapter(),
            slots: <String, Dependent<EventState>>{},
          ),
          middleware: <Middleware<EventState>>[],
        );
}
