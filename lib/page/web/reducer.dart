import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebScaffoldState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebScaffoldState>>{},
  );
}
