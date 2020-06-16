import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class UserRegisterPage extends Page<UserRegisterState, Map<String, dynamic>> {
  UserRegisterPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<UserRegisterState>(
                adapter: null,
                slots: <String, Dependent<UserRegisterState>>{
                }),
            middleware: <Middleware<UserRegisterState>>[
            ],);

}
