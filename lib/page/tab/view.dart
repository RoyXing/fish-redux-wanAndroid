import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      elevation: 0.0,
      title: Text(state.title ?? ""),
      centerTitle: true,
    ),
    body: DefaultTabController(
      length: state.labelId == Constant.label_system ? state.model.children.length : state.lists.length,
      child: Column(
        children: <Widget>[
          Material(
            color: state.themeColor,
            child: SizedBox(
              height: 48.0,
              width: double.infinity,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: state.labelId == Constant.label_system
                    ? state.model.children.map((e) {
                        if (e != null) {
                          return Tab(text: e.name);
                        }
                        return null;
                      })?.toList()
                    : state.lists.map((e) {
                        if (e != null) {
                          return Tab(text: e.name);
                        }
                        return null;
                      }).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                children: state.labelId == Constant.label_system
                    ? state.model.children.map((model) {
                        return routes.buildPage('tabview', {"labelId": state.labelId, "model": model});
                      }).toList()
                    : state.lists.map((model) {
                        return routes.buildPage('tabview', {"labelId": state.labelId, "model": model});
                      }).toList()),
          ),
        ],
      ),
    ),
  );
}
