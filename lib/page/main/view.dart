import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  var i18n = I18n.of(viewService.context);
  List<_Page> _allPages = [
    _Page("home", i18n.titleHome),
    _Page("repos", i18n.titleRepos),
    _Page("events", i18n.titleEvents),
    _Page("system", i18n.titleSystem),
  ];

  Widget getTabLayout() {
    return TabBar(
        isScrollable: true,
        labelPadding: EdgeInsets.all(12.0),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: _allPages.map((e) => Text(e.labelName)).toList());
  }

  Widget getTabBarViewLayout() {
    return TabBarView(children: <Widget>[
      routes.buildPage('home', null),
      routes.buildPage('repos', null),
      routes.buildPage('events', null),
      routes.buildPage('system', null),
    ]);
  }

  return DefaultTabController(
    length: _allPages.length,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: state.themeColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Utils.getImgPath('ali_connors')),
                  ),
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        title: getTabLayout(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              NavigatorUtil.pushPage(viewService.context, null);
            },
          ),
        ],
      ),
      body: getTabBarViewLayout(),
      drawer: Drawer(
        child: routes.buildPage('drawer', null),
      ),
    ),
  );
}

class _Page {
  final String labelId;
  final String labelName;

  _Page(this.labelId, this.labelName);
}
