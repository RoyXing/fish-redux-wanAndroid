import 'package:fishreduxwanandroid/model/home/repos_model.dart';
import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/navigator_util.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:fishreduxwanandroid/utils/utils.dart';
import 'package:fishreduxwanandroid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(
    this.model, {
    Key key,
    this.labelId,
    this.isHome,
  }) : super(key: key);

  final ReposModel model;
  final String labelId;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorUtil.pushWeb(context, title: model.title, url: model.link);
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0, top: 16, right: 16, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listTitle,
                  ),
                  Gaps.vGap10,
                  Text(
                    model.desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listContent,
                  ),
                  Gaps.vGap5,
                  new Row(
                    children: <Widget>[
                      new LikeBtn(
                        id: model.originId ?? model.id,
                        isLike: model.collect ?? false,
                      ),
                      Gaps.hGap10,
                      new Text(
                        model.author,
                        style: TextStyles.listExtra,
                      ),
                      Gaps.hGap10,
                      new Text(
                        Utils.getTimeLine(context, model.publishTime),
                        style: TextStyles.listExtra,
                      ),
                    ],
                  )
                ],
              ),
            ),
            new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 12.0),
              child: new CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.purple,
                child: new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(
                    model.superChapterName ?? "文章",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 11.0),
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.33, color: Colours.divider),
        ),
      ),
    );
  }
}
