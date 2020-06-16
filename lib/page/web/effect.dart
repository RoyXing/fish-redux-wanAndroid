import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:share/share.dart';
import 'action.dart';
import 'state.dart';

Effect<WebScaffoldState> buildEffect() {
  return combineEffects(<Object, Effect<WebScaffoldState>>{
    WebScaffoldAction.onPopSelected: _onPopSelected,
  });
}

void _onPopSelected(Action action, Context<WebScaffoldState> ctx) {
  String value = action.payload;
  switch (value) {
    case "browser":
      NavigatorUtil.launchInBrowser(ctx.state.url, title: ctx.state.title ?? "");
      break;
    case "share":
      Share.share('''
      ${ctx.state.title}
      ${ctx.state.url}
      ''');
      break;
    default:
      break;
  }
}
