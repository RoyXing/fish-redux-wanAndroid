import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/component/likebtn/state.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

class ItemState implements Cloneable<ItemState> {
  ReposModel model;
  bool isCollectPage = false;

  ItemState({this.model, this.isCollectPage});

  @override
  ItemState clone() {
    return ItemState()
      ..model = model
      ..isCollectPage = isCollectPage;
  }
}

class ItemLikeConnector extends ConnOp<ItemState, LikeBtnState> {
  @override
  void set(ItemState state, LikeBtnState subState) {
    state.model = subState.model;
  }

  @override
  LikeBtnState get(ItemState state) {
    return LikeBtnState()
      ..model = state.model
      ..isCollectPage = state.isCollectPage;
  }
}
