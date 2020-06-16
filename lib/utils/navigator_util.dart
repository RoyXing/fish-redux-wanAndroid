import 'package:fishreduxwanandroid/model/home/system_model.dart';
import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_utils/library_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorUtil {
  static void pushPage(
    BuildContext context,
    Widget page, {
    String pageName,
    bool needLogin = false,
  }) {
    if (context == null || page == null) return;
    if (needLogin && !Utils.isLogin()) {
      pushPage(context, routes.buildPage('login', null));
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => page));
  }

  static void replacementPage(
    BuildContext context,
    Widget page, {
    String pageName,
    bool needLogin = false,
  }) {
    if (context == null || page == null) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => page));
  }

  static void pushWeb(BuildContext context, {String title, String titleId, String url, bool isHome: false}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;
    if (url.endsWith(".apk")) {
      launchInBrowser(url, title: title ?? titleId);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return routes.buildPage('web', {
          "title": title,
          "titleId": titleId,
          "url": url,
        });
      }));
    }
  }

  static void pushTabPage(BuildContext context,
      {String labelId, String title, String titleId, TreeModel treeModel}) {
    if (context == null) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => routes.buildPage(
                'tab', {'labelId': labelId, 'title': title, 'titleId': titleId, 'model': treeModel})));
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
