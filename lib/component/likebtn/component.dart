import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LikeBtnComponent extends Component<LikeBtnState> {
  static final String path = "like_btn_component";

  LikeBtnComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LikeBtnState>(
                adapter: null,
                slots: <String, Dependent<LikeBtnState>>{
                }),);

}
