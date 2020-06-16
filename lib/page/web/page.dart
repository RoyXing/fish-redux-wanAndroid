import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebScaffoldPage extends Page<WebScaffoldState, Map<String, dynamic>> {
  WebScaffoldPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WebScaffoldState>(
                adapter: null,
                slots: <String, Dependent<WebScaffoldState>>{
                }),
            middleware: <Middleware<WebScaffoldState>>[
            ],);

}
