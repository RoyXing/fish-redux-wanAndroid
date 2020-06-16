import 'package:fish_redux/fish_redux.dart';

enum WebScaffoldAction { onPopSelected }

class WebScaffoldActionCreator {
  static Action onPopSelected(String value) {
    return Action(WebScaffoldAction.onPopSelected, payload: value);
  }
}
