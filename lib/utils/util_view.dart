import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_logger/simple_logger.dart';

// TODO: 2020/10/26 一些便于使用的方法

/// 显示一个Toast */
showToast(String message) => Fluttertoast.showToast(
    msg: message, gravity: ToastGravity.CENTER, fontSize: 16.0);

/// 显示一个button */
showButton(String title, VoidCallback callback) => RaisedButton(
      onPressed: callback,
      child: Text(title),
    );

/// 显示 */
showButtonToPush(BuildContext context, String title, Widget widget) =>
    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );

/// 快捷Button */
class WidgetFastButton extends StatefulWidget {
  final String title;
  final VoidCallback callback;

  const WidgetFastButton(this.title, this.callback);

  @override
  _WidgetFastButtonState createState() =>
      _WidgetFastButtonState(title, callback);
}

class _WidgetFastButtonState extends State {
  final String title;
  final VoidCallback callback;

  _WidgetFastButtonState(this.title, this.callback);

  @override
  Widget build(BuildContext context) =>
      RaisedButton(onPressed: callback, child: Text(title));
}

//从Asset加载指定的key
loadAssetString(String key) async {
  return await rootBundle.loadString(key);
}

/// log */
final logger = SimpleLogger();

logInfo(String message) {
  logger.log(Level.INFO, message);
}
