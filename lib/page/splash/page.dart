import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class splashPage extends Page<SplashState, Map<String, dynamic>> {
  splashPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SplashState>(
                adapter: null,
                slots: <String, Dependent<SplashState>>{
                }),
            middleware: <Middleware<SplashState>>[
            ],);

}
