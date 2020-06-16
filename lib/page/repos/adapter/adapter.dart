import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/repos/component.dart';
import 'package:fishreduxwanandroid/page/repos/state.dart';

class ReposAdapter extends SourceFlowAdapter<ReposState> {
  ReposAdapter()
      : super(pool: <String, Component<Object>>{
          'repos': RepoItemComponent(),
        });
}
