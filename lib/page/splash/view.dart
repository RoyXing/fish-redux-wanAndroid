import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/splash/action.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:library_utils/library_utils.dart';

import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  I18n i18n = I18n.of(viewService.context);

  Widget _buildSplashBg() {
    return Image.asset(
      Utils.getImgPath('splash_bg'),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }

  Widget _buildAdWidget() {
    var _splashModel = state.splashModel;
    if (_splashModel == null) {
      return new Container(
        height: 0.0,
      );
    }
    return new Offstage(
      offstage: !(state.status == 1),
      child: new InkWell(
        onTap: () {
          if (ObjectUtil.isEmpty(_splashModel.url)) return;
          dispatch(SplashActionCreator.onGoToMain());
          NavigatorUtil.pushWeb(viewService.context,
              title: _splashModel.title, url: _splashModel.url);
        },
        child: new Container(
          alignment: Alignment.center,
          child: new CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            imageUrl: state.splashModel.imgUrl,
            placeholder: (context, url) => _buildSplashBg(),
            errorWidget: (context, url, error) => _buildSplashBg(),
          ),
        ),
      ),
    );
  }

  return Material(
    child: Stack(
      children: <Widget>[
        Offstage(
          offstage: !(state.status == 0),
          child: _buildSplashBg(),
        ),
        Offstage(
          offstage: !(state.status == 2),
          child: ObjectUtil.isEmpty(state.bannerList)
              ? Container()
              : Swiper(
                  autoStart: false,
                  circular: false,
                  indicator: CircleSwiperIndicator(
                    radius: 4.0,
                    padding: EdgeInsets.only(bottom: 30.0),
                    itemColor: Colors.black26,
                  ),
                  children: state.bannerList,
                ),
        ),
        _buildAdWidget(),
        Offstage(
          offstage: !(state.status == 1),
          child: Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                dispatch(SplashActionCreator.onGoToMain());
              },
              child: new Container(
                  padding: EdgeInsets.all(12.0),
                  child: new Text(
                    i18n.jump_count(state.count.toString()),
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  decoration: new BoxDecoration(
                      color: Color(0x66000000),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      border: new Border.all(width: 0.33, color: Colours.divider))),
            ),
          ),
        ),
      ],
    ),
  );
}
