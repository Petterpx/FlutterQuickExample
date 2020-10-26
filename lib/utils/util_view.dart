import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

// TODO: 2020/10/26 一些便于使用的方法

//显示一个toast
showToast(String message) => Fluttertoast.showToast(
    msg: message, gravity: ToastGravity.CENTER, fontSize: 16.0);

//返回一个button
showButton(String title, VoidCallback callback) => RaisedButton(
      onPressed: callback,
      child: Text(title),
    );

//从Asset加载指定的key
loadAssetString(String key) async {
  return await rootBundle.loadString(key);
}
