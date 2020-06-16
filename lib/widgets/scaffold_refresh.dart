import 'package:fishreduxwanandroid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

typedef OnRefreshCallback = Future<void> Function({bool isReload});

class RefreshScaffold extends StatefulWidget {
  const RefreshScaffold({
    Key key,
    this.labelId,
    this.loadStatus,
    @required this.controller,
    this.enablePullUp: true,
    this.onRefresh,
    this.onLoadMore,
    this.child,
    this.itemCount,
    this.builder,
    this.themeColor,
  }) : super(key: key);

  final String labelId;
  final int loadStatus;
  final EasyRefreshController controller;
  final bool enablePullUp;
  final OnLoadCallback onLoadMore;
  final OnRefreshCallback onRefresh;
  final List<Widget> child;
  final itemCount;
  final IndexedWidgetBuilder builder;
  final Color themeColor;

  @override
  _RefreshScaffoldState createState() => _RefreshScaffoldState();
}

class _RefreshScaffoldState extends State<RefreshScaffold> {
  ScrollController _scrollController;
  bool isShowFloatBtn = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      int offset = _scrollController.offset.toInt();
      if (offset < 480 && isShowFloatBtn) {
        isShowFloatBtn = false;
        setState(() {});
      } else if (offset > 480 && !isShowFloatBtn) {
        isShowFloatBtn = true;
        setState(() {});
      }
    });
  }

  Widget buildFloatingActionButton() {
    if (_scrollController == null || !_scrollController.hasClients || _scrollController.offset < 480) {
      return null;
    }
    return FloatingActionButton(
      heroTag: widget.labelId,
      backgroundColor: widget.themeColor,
      child: Icon(
        Icons.keyboard_arrow_up,
      ),
      onPressed: () {
        _scrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.linear);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          EasyRefresh.custom(
            slivers: [
              SliverList(
                delegate: widget.child != null
                    ? SliverChildListDelegate(widget.child)
                    : SliverChildBuilderDelegate(
                        widget.builder,
                        childCount: widget.itemCount,
                      ),
              )
            ],
            onLoad: widget.onLoadMore,
            onRefresh: widget.onRefresh,
            controller: widget.controller,
            scrollController: _scrollController,
          ),
          StatusViews(
            widget.loadStatus,
            onTap: () {
              widget.onRefresh();
            },
            themeColor: widget.themeColor,
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }
}
