import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/model/splash/splash_model.dart';
import 'package:fishreduxwanandroid/network/http_repository.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/http_utils.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:library_utils/library_utils.dart';

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    Lifecycle.initState: _init,
    SplashAction.onGoToMain: _goToMain,
    Lifecycle.dispose: _dispose,
  });
}

TimerUtil _timerUtil;

void _init(Action action, Context<SplashState> ctx) async {
  HttpRepository.instance.initBaseUrl(Constant.wan_android);
  HttpRepository.instance.setHeader(SpUtil.getString(Constant.keyAppToken));

//  HttpRepository.instance.addInterceptor(LogInterceptor(requestBody: true, responseBody: true));
  SplashModel _splashModel = SpUtil.getObj(Constant.key_splash_model, (map) => SplashModel.fromJson(map));
  if (_splashModel != null) {
    ctx.dispatch(SplashActionCreator.updateSplashModel(_splashModel));
  }
  HttpUtils().getSplash().then((model) {
    if (!ObjectUtil.isEmpty(model)) {
      if (_splashModel == null || _splashModel.imgUrl != model.imgUrl) {
        _splashModel = model;
        SpUtil.putObject(Constant.key_splash_model, model);
        ctx.dispatch(SplashActionCreator.updateSplashModel(_splashModel));
      }
    } else {
      SpUtil.putObject(Constant.key_splash_model, null);
    }
  });

  Future.delayed(Duration(milliseconds: 500)).then((value) {
    var keyGuide = SpUtil.getBool(Constant.key_guide, defValue: true);
    if (keyGuide && ObjectUtil.isNotEmpty(ctx.state.guideList)) {
      SpUtil.putBool(Constant.key_guide, false);
      _initBanner(ctx);
    } else {
      _initSplash(_splashModel, ctx);
    }
  });
}

void _initSplash(SplashModel splashModel, Context<SplashState> ctx) {
  if (splashModel == null) {
    _goMain(ctx.context);
  } else {
    ctx.dispatch(SplashActionCreator.updateStatus(1));
    _timerUtil = TimerUtil(mTotalTime: 3000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      ctx.dispatch(SplashActionCreator.updateCount(_tick.toInt()));
      if (_tick == 0) {
        _goMain(ctx.context);
      }
    });
    _timerUtil.startCountDown();
  }
}

void _initBanner(Context<SplashState> ctx) {
  List guideList = ctx.state.guideList;
  List<Widget> bannerList = [];
  for (int i = 0; i < guideList.length; i++) {
    if (i == guideList.length - 1) {
      bannerList.add(Stack(
        children: <Widget>[
          new Image.asset(
            guideList[i],
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Container(
              margin: EdgeInsets.only(bottom: 160.0),
              child: InkWell(
                onTap: () {
                  _goMain(ctx.context);
                },
                child: new CircleAvatar(
                  radius: 48.0,
                  backgroundColor: Colors.indigoAccent,
                  child: new Padding(
                    padding: EdgeInsets.all(2.0),
                    child: new Text(
                      '立即体验',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
    } else {
      bannerList.add(new Image.asset(
        guideList[i],
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ));
    }
  }
  ctx.dispatch(SplashActionCreator.updateBannerList(bannerList));
  ctx.dispatch(SplashActionCreator.updateStatus(2));
}

void _goToMain(Action action, Context<SplashState> ctx) {
  _goMain(ctx.context);
}

void _goMain(BuildContext context) {
  NavigatorUtil.replacementPage(context, routes.buildPage('main', null));
}

void _dispose(Action action, Context<SplashState> ctx) {
  _timerUtil?.cancel();
}
