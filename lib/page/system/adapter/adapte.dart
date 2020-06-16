import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/tree/component.dart';
import 'package:fishreduxwanandroid/page/system/state.dart';

class SystemItemAdapter extends SourceFlowAdapter<SystemState> {
  SystemItemAdapter()
      : super(pool: <String, Component<Object>>{
          'system': TreeItemComponent(),
        });
}
