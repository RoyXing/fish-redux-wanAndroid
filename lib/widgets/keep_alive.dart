import 'package:flutter/material.dart';

class _KeepAliveWidget extends StatefulWidget {
  final Widget child;

  _KeepAliveWidget({Key key, this.child}) : super(key: key);

  @override
  __KeepAliveWidgetState createState() => __KeepAliveWidgetState();
}

class __KeepAliveWidgetState extends State<_KeepAliveWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

Widget keepAliveWrapper(Widget child) => _KeepAliveWidget(child: child);
