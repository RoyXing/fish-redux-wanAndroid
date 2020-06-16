import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem(
      {this.margin,
      this.titleColor,
      this.leftIcon,
      this.titleId,
      this.title,
      this.extraId,
      this.extra,
      this.rightIcon,
      this.onTap,
      Key key})
      : super(key: key);

  final EdgeInsetsGeometry margin;
  final Color titleColor;
  final IconData leftIcon;
  final String title;
  final String extraId;
  final String titleId;
  final String extra;
  final IconData rightIcon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);

    return Container(
      height: 56.0,
      margin: margin ?? EdgeInsets.only(top: 0.0),
      child: ListTile(
        onTap: onTap,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              leftIcon ?? Icons.whatshot,
              color: titleColor ?? Colors.blueAccent,
            ),
            Gaps.hGap10,
            Expanded(
              child: Text(
                title ?? i18n.titleRepos,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: titleColor ?? Colors.blueAccent,
                  fontSize: Utils.getTitleFontSize(i18n.titleRepos),
                ),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              extra ?? i18n.more,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Icon(
              rightIcon ?? Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.33,
        color: Colours.divider,
      ))),
    );
  }
}
