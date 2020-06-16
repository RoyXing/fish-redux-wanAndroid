import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TreeItemState state, Dispatch dispatch, ViewService viewService) {
  final List<Widget> chips = state.treeModel.children.map((TreeModel _model) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      key: ValueKey<String>(_model.name),
      backgroundColor: Utils.getChipBgColor(_model.name),
      label: Text(
        _model.name,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }).toList();

  return InkWell(
    onTap: () {
      dispatch(TreeItemActionCreator.onTabPage());
    },
    child: _ChipsTile(
      label: state.treeModel.name,
      children: chips,
    ),
  );
}

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children,
  }) : super(key: key);
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
      Text(
        label,
        style: TextStyles.listTitle,
      ),
      Gaps.vGap10,
    ];

    cardChildren.add(Wrap(
        children: children.map((Widget chip) {
      return Padding(
        padding: EdgeInsets.all(3.0),
        child: chip,
      );
    }).toList()));
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,
      ),
      decoration: BoxDecoration(
          color: Colors.white, border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider))),
    );
  }
}
