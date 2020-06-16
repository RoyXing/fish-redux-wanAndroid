import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/global/state.dart';
import 'package:fishreduxwanandroid/global/store.dart';
import 'package:fishreduxwanandroid/page/collection/page.dart';
import 'package:fishreduxwanandroid/page/drawer/page.dart';
import 'package:fishreduxwanandroid/page/events/page.dart';
import 'package:fishreduxwanandroid/page/home/page.dart';
import 'package:fishreduxwanandroid/page/main/page.dart';
import 'package:fishreduxwanandroid/page/repos/page.dart';
import 'package:fishreduxwanandroid/page/setting/page.dart';
import 'package:fishreduxwanandroid/page/splash/page.dart';
import 'package:fishreduxwanandroid/page/system/page.dart';
import 'package:fishreduxwanandroid/page/tab/page.dart';
import 'package:fishreduxwanandroid/page/tab/tabview/page.dart';
import 'package:fishreduxwanandroid/page/user/user_login/page.dart';
import 'package:fishreduxwanandroid/page/user/user_register/page.dart';
import 'package:fishreduxwanandroid/page/web/page.dart';

PageRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      "splash": splashPage(),
      "main": MainPage(),
      "login": UserLoginPage(),
      "register": UserRegisterPage(),
      "web": WebScaffoldPage(),
      'home': HomePage(),
      'repos': ReposPage(),
      'events': EventPage(),
      'system': SystemPage(),
      'tab': TabPage(),
      'tabview': TabViewPage(),
      'login': UserLoginPage(),
      'register': UserRegisterPage(),
      'drawer': DrawerPage(),
      'collection': CollectionPage(),
      'setting': SettingPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(GlobalStore.store, (pageState, GlobalState appState) {
          final GlobalBaseState p = pageState;
          if (p.themeColor != appState.themeColor || p.locale != appState.locale) {
            if (pageState is Cloneable) {
              final Object copy = pageState.clone();
              final GlobalBaseState newState = copy;
              print('visitor ${appState.locale} ${appState.themeColor}');
              newState.themeColor = appState.themeColor;
              newState.locale = appState.locale;
              return newState;
            }
          }
          return pageState;
        });
      }

      /// AOP
      /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
      /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

        /// Effect AOP
        effectMiddleware: <EffectMiddleware<dynamic>>[
//          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    });

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
