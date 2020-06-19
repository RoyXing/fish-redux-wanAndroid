import 'dart:async';

import 'package:fishreduxwanandroid/app.dart';
import 'package:fishreduxwanandroid/generated/i18n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'config/global.dart';

Future<Null> main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (kReleaseMode) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
    return CrashWidget(details.exception, details.stack);
  };

  FlutterError.onError = (FlutterErrorDetails details) {};
  runZonedGuarded<Future<Null>>(() async {
    Global.init(() {
      runApp(MainApp());
    });
  }, (error, stackTrace) async {
    print("$error");
    print('这是 runZonedGuarded中捕获的异常 ${stackTrace.toString()}');

    ///进行网络日志收集 或者在错误页面收集
    ///、、、、、
  });
}

class CrashWidget extends StatelessWidget {
  CrashWidget(this.errorMsg, this.trace);

  final dynamic errorMsg;
  final dynamic trace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.of(context).titleCrash),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              '错误信息:${errorMsg.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '堆栈信息:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text('${trace.toString()}'),
          ],
        ),
      )),
    );
  }
}
