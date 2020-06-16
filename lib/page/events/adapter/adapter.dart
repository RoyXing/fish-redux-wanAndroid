import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/article/component.dart';

import '../state.dart';

class EventAdapter extends SourceFlowAdapter<EventState> {
  EventAdapter()
      : super(pool: <String, Component<Object>>{
          'article': ArticleItemComponent(),
        });
}
