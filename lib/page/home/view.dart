import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/model/home/banner_model.dart';
import 'package:fishreduxwanandroid/page/home/action.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/widgets/article_item.dart';
import 'package:fishreduxwanandroid/widgets/header_item.dart';
import 'package:fishreduxwanandroid/widgets/repos_item.dart';
import 'package:fishreduxwanandroid/widgets/scaffold_refresh.dart';
import 'package:fishreduxwanandroid/widgets/widgets.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  I18n i18n = I18n.of(viewService.context);

  Widget _buildBanner() {
    if (state.bannerList == null || state.bannerList.length <= 0) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Swiper(
        indicatorAlignment: AlignmentDirectional.topEnd,
        circular: true,
        interval: Duration(seconds: 5),
        indicator: NumberSwipeIndicator(),
        children: state.bannerList.map((BannerModel banner) {
          return InkWell(
            onTap: () {
              NavigatorUtil.pushWeb(viewService.context,
                  title: banner.title, url: banner.url, titleId: banner.id.toString());
            },
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: banner.imagePath,
              placeholder: (context, url) => ProgressView(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRepos() {
    if (state.reposList == null || state.reposList.length <= 0) {
      return Container();
    }
    List<Widget> _children = state.reposList.map((e) {
      return ReposItem(
        e,
        isHome: true,
      );
    }).toList();
    List<Widget> children = List();
    children.add(HeaderItem(
      leftIcon: Icons.book,
      title: i18n.recRepos,
      onTap: () {
        NavigatorUtil.pushTabPage(viewService.context, title: i18n.recRepos, labelId: Constant.label_repos);
      },
    ));
    children.addAll(_children);
    return Column(
      key: state.globalKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _buildWXArticle() {
    if (state.wxArticleList == null || state.wxArticleList.length <= 0) {
      return Container();
    }
    List<Widget> _children = state.wxArticleList.map((e) {
      return ArticleItem(
        e,
        isHome: true,
      );
    }).toList();
    List<Widget> children = List();
    children.add(HeaderItem(
      titleColor: Colors.green,
      leftIcon: Icons.library_books,
      title: i18n.recWxArticle,
      onTap: () {
        NavigatorUtil.pushTabPage(viewService.context, title: i18n.recWxArticle, labelId: Constant.label_vx);
      },
    ));
    children.addAll(_children);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  return RefreshScaffold(
    loadStatus: state.loadStatus,
    themeColor: state.themeColor,
    controller: state.controller,
    labelId: i18n.titleHome,
    onLoadMore: () async {},
    onRefresh: ({bool isReload}) async {
      dispatch(HomeActionCreator.onRefresh());
    },
    child: [
      _buildBanner(),
      _buildRepos(),
      _buildWXArticle(),
    ],
  );
}

class NumberSwipeIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text(
        "${++index}/$itemCount",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 11.0,
        ),
      ),
    );
  }
}
