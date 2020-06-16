import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/page/web/action.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/widgets/likebtn/like_button.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'state.dart';

Widget buildView(WebScaffoldState state, Dispatch dispatch, ViewService viewService) {
  I18n i18n = I18n.of(viewService.context);
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text(
        state.title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      actions: <Widget>[
        LikeButton(
          width: 56.0,
          duration: Duration(milliseconds: 500),
        ),
        new PopupMenuButton(
            padding: const EdgeInsets.all(0.0),
            onSelected: (value) {
              dispatch(WebScaffoldActionCreator.onPopSelected(value));
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                      value: "browser",
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title: new Container(
                            alignment: Alignment.center,
                            child: new Row(
                              children: <Widget>[
                                Icon(
                                  Icons.language,
                                  color: Colours.gray_66,
                                  size: 22.0,
                                ),
                                Gaps.hGap10,
                                Text(
                                  '浏览器打开',
                                  style: TextStyles.listContent,
                                )
                              ],
                            ),
                          ))),
                  new PopupMenuItem<String>(
                      value: "share",
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title: new Container(
                            alignment: Alignment.center,
                            child: new Row(
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  color: Colours.gray_66,
                                  size: 22.0,
                                ),
                                Gaps.hGap10,
                                Text(
                                  '分享',
                                  style: TextStyles.listContent,
                                )
                              ],
                            ),
                          ))),
                ])
      ],
    ),
    body: WebView(
      onWebViewCreated: (WebViewController controller) {},
      initialUrl: state.url,
      javascriptMode: JavascriptMode.unrestricted,
    ),
  );
}
