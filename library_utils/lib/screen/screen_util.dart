import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

class ScreenUtil {

  static ScreenUtil instance;
  static const int defaultWidth = 1080;
  static const int defaultHeight = 1920;

  num uiWidthPx;
  num uiHeightPx;

  //控制字体是否要根据系统的'字体大小'辅助选项进行缩放
  bool allowFontScaling;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;

  ScreenUtil._();

  factory ScreenUtil() {
    return instance;
  }

  static void init({
    num width = defaultHeight,
    num height = defaultHeight,
    bool allowFontScaling = false,
  }) {
    if (instance == null) {
      instance = ScreenUtil._();
    }
    instance.uiWidthPx = width;
    instance.uiHeightPx = height;
    instance.allowFontScaling = allowFontScaling;

    _mediaQueryData = MediaQueryData.fromWindow(ui.window);
    _pixelRatio = _mediaQueryData.devicePixelRatio;
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _statusBarHeight = _mediaQueryData.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    _textScaleFactor = _mediaQueryData.textScaleFactor;

    print("_pixelRatio = $_pixelRatio _screenWidth = $_screenWidth, _screenHeight = $_screenHeight,"
        " _statusBarHeight = $_statusBarHeight, _bottomBarHeight = $_bottomBarHeight, _textScaleFactor = $_textScaleFactor");
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// 每个逻辑像素的字体像素数，字体的缩放比例
  static double get textScaleFactor => _textScaleFactor;

  ///设备像素密度
  static double get pixelRatio => _pixelRatio;

  ///当前设备宽度 dp
  static double get screenWidthDp => _screenWidth;

  ///当前设备高度 dp
  static double get screenHeightDp => _screenHeight;

  ///当前设备宽度 px
  static double get screenWidth => _screenWidth * _pixelRatio;

  ///当前设备高度 px
  static double get screenHeight => _screenHeight * _pixelRatio;

  ///状态栏高度 dp 刘海屏会更高
  static double get statusBarHeight => _statusBarHeight;

  ///底部安全距离 dp
  static double get bottomBarHeight => _bottomBarHeight;

  ///实际的dp与UI设计px的比例
  double get scaleWith => _screenWidth / uiWidthPx;

  double get scaleHeight => _screenHeight / uiHeightPx;

  double get scaleText => scaleWith;

  ///根据UI设计的设备宽度适配
  ///高度也可以根据这个来做适配保证不变形
  num setWidth(num width) => width * scaleWith;

  ///根据UI设计的设备高度适配
  ///当发现UI设计中的一屏显示的与当前效果不符合时，
  ///或者形状有差异时，建议使用此方法实现高度适配
  ///高度适配主要针对想根据UI设计的一屏展示一样的效果
  num setHeight(num height) => height * scaleHeight;

  ///字体大小适配方法
  ///@param [fontSize] UI设计上字体的大小,单位px.
  num setSp(num fontSize, {bool allowFontScalingSelf}) => allowFontScalingSelf == null
      ? (allowFontScaling ? (fontSize * scaleText) : ((fontSize * scaleText) / _textScaleFactor))
      : (allowFontScalingSelf ? (fontSize * scaleText) : ((fontSize * scaleText) / _textScaleFactor));
}

extension SizeExtension on num {
  num get w => ScreenUtil().setWidth(this);

  num get h => ScreenUtil().setHeight(this);

  num get sp => ScreenUtil().setSp(this);

  num get ssp => ScreenUtil().setSp(this, allowFontScalingSelf: true);
}
