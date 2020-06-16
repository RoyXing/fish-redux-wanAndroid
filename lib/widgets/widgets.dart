import 'package:fishreduxwanandroid/route/route.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/common.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24.0,
        width: 24.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: color ?? Colors.blue,
        ),
      ),
    );
  }

  ProgressView({this.color});

  final Color color;
}

class LikeBtn extends StatelessWidget {
  const LikeBtn({
    Key key,
    this.id,
    this.isLike,
  }) : super(key: key);
  final int id;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Utils.isLogin()) {
        } else {
          NavigatorUtil.pushPage(context, routes.buildPage('login', null));
        }
      },
      child: Icon(
        Icons.favorite,
        color: (isLike && Utils.isLogin() ? Colors.redAccent : Colours.gray_99),
      ),
    );
  }
}

class StatusViews extends StatelessWidget {
  const StatusViews(
    this.status, {
    Key key,
    this.themeColor,
    this.onTap,
  }) : super(key: key);

  final int status;
  final GestureTapCallback onTap;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadStatus.fail:
        return Container(
          width: double.infinity,
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                onTap();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'packages/fishreduxwanandroid/images/ic_network_error.png',
                    width: 100,
                    height: 100,
                  ),
                  Gaps.vGap10,
                  Text(
                    "网络出问题了～ 请您查看网络设置",
                    style: TextStyles.listContent,
                  ),
                  Gaps.vGap5,
                  Text(
                    "点击屏幕，重新加载",
                    style: TextStyles.listContent,
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case LoadStatus.loading:
        return new Container(
          alignment: Alignment.center,
          color: Colours.gray_f0,
          child: new ProgressView(
            color: themeColor ?? Colors.blue,
          ),
        );
        break;
      case LoadStatus.empty:
        return new Container(
          color: Colors.white,
          width: double.infinity,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'packages/fishreduxwanandroid/images/ic_data_empty.png',
                  width: 60,
                  height: 60,
                ),
                Gaps.vGap10,
                new Text(
                  "空空如也～",
                  style: TextStyles.listContent2,
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container(
          height: 0,
          width: 0,
        );
    }
  }
}
