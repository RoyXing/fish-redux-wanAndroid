import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/repos_model.dart';

class LikeBtnState implements Cloneable<LikeBtnState> {
  ReposModel model;
  bool isCollectPage = false;

  int get actuallyId => model.originId ?? model.id;

  @override
  LikeBtnState clone() {
    return LikeBtnState()
      ..model = model
      ..isCollectPage = isCollectPage;
  }
}
