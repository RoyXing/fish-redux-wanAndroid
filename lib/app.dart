import 'package:fishreduxwanandroid/config/language_config.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/global/store.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:flutter/material.dart' hide Page, Action;
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_utils/library_utils.dart';

import 'global/action.dart';
import 'route/route.dart';

class MainApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    var themeColorKey = SpUtil.getString(Constant.key_theme_color);
    Color themeColor = Colors.blue;
    if (ObjectUtil.isNotEmpty(themeColor)) {
      themeColor = Colours.themeColorMap[themeColorKey];
    }
    GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor(themeColor));
    I18n.onLocaleChanged = onLocalChanged;
  }

  void onLocalChanged(Locale locale) {
    GlobalStore.store.dispatch(GlobalActionCreator.changeLanguage(locale));
    setState(() {
      I18n.locale = locale;
    });
    if (locale.toString() != LanguageConfig.languageCode) {
      LanguageConfig.save(locale.toString());
    }
  }

  Locale localeResolutionCallback(Locale locale, Iterable<Locale> supportedLocales) {
    Locale _currentLocale;
    if (I18n.delegate.isSupported(locale)) {
      _currentLocale = locale;
    } else {
      _currentLocale = I18n.delegate.supportedLocales.first;
    }
    LanguageConfig.init().then((cacheLanguage) {
      if (cacheLanguage == null && locale != null) {
        final String languageCode = locale?.languageCode;
        final String lang = locale?.toString();
        String systemLocale = 'en_US';
        if ("zh_CN" == lang || "zh" == languageCode) {
          systemLocale = "zh_CN";
        }
        this.onLocalChanged(Locale(systemLocale));
      } else {
        this.onLocalChanged(Locale(cacheLanguage));
      }
    });
    GlobalStore.store.dispatch(GlobalActionCreator.changeLanguage(locale));
    return _currentLocale;
  }

  //statusBar设置为透明，去除半透明遮罩
  final SystemUiOverlayStyle _style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return MaterialApp(
      title: 'WanAndroid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: GlobalStore.state.themeColor,
        indicatorColor: Colors.white,
      ),
      home: routes.buildPage('splash', null),
      supportedLocales: I18n.delegate.supportedLocales,
      localizationsDelegates: [
        I18n.delegate,
        GlobalEasyRefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: localeResolutionCallback,
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) {
          return routes.buildPage(setting.name, setting.arguments);
        });
      },
    );
  }
}
