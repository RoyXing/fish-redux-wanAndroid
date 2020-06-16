import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class UserLoginPage extends Page<UserLoginState, Map<String, dynamic>> {
  UserLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<UserLoginState>(
                adapter: null,
                slots: <String, Dependent<UserLoginState>>{
                }),
            middleware: <Middleware<UserLoginState>>[
            ],);

}
