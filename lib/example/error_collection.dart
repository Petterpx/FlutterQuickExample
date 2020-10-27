import 'dart:async';
import 'dart:html';
import 'dart:ui';

import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';

// TODO: 2020/10/26 异常示例
/// 初始化全局异常
/// remind: 不能捕获异步异常 */
void initError() {
  FlutterError.onError = (details) {
    print(details.exceptionAsString());
  };
}

/// 无法捕获的异步异常示例
/// remind:在Flutter中，没有private类似的修饰符，如果此方法或者变量不想被其他文件调用，使用 _ 前缀即可
/// */
_noTryError() {
  try {
    Future.delayed(Duration(seconds: 1))
        .then((value) => Future.error("无法捕获的异常"));
  } catch (e) {
    print(e);
  }
}

/// 使用zone拦截print */
_errorPrint() {
  runZoned(() => runApp(Text("test")),
      zoneSpecification: ZoneSpecification(print: (self, parent, zone, line) {
    parent.print(zone, "测试拦截日志输出：$line");
  }));
}

/// 收集全局异常 */
_runZonedError() {
  runZoned(() {
    runApp(Text("data"));
  }, onError: (Object object, StackTrace stack) {
    print(stack.toString() + object.toString());
  });
}

void test() {
  runZoned(() {

    runZoned(() {},onError: (e){

    });

  },onError: (e){
    print('');
  });
}

// TODO: 2020/10/27 完整的异常日志收集流程

/// 收集日志 */
void collectLog(String log) {
  logger.info(log);
}

/// 上传错误和具体的日志逻辑 */
void reportErrorAndLog(FlutterErrorDetails details) {
  logger.info(details.exceptionAsString());
}

/// 构建错误信息 */
FlutterErrorDetails makeDetails(Object object, StackTrace stackTrace) {
  return FlutterErrorDetails(exception: object, stack: stackTrace);
}

/// 示例Main */
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
    () => runApp(Text("示例")),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        // 收集所有通过print打印的日志
        collectLog(line);
      },
    ),
    //捕获所有发生的异常
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );
}
