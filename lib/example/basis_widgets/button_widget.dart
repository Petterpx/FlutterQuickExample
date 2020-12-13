import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:cloud_flutter_app/utils/widget_text_to_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Button示例 */
class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  /// 一个回调函数,接收一个message,返回一个函数，函数内容未showToast
  /// 下面为一个简写,通俗转换为下面：
  // _pressed(message) {
  //     // ignore: unnecessary_statements
  //     return () {
  //       showToast(message);
  //     };
  //   }
  /// */
  _pressed(message) => () => showToast(message);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ButtonToTitleWidget(
                  title: "漂浮按钮，默认带有阴影和灰色背景，按下，阴影变大",
                  widget: RaisedButton(
                    child: Text("RaisedButton"),
                    onPressed: _pressed("RaisedButton"),
                  )),
              ButtonToTitleWidget(
                  title: "FlatButton 即扁平按钮，默认背景透明并不带阴影，按下后，会有背景色",
                  widget: FlatButton(
                    child: Text("FlatButton"),
                    onPressed: _pressed("FlatButton"),
                  )),
              ButtonToTitleWidget(
                  title: "默认有一个边框，不带阴影且背景透明。\n 按下后，边框颜色变透明，同时出现背景和阴影(较弱)",
                  widget: OutlineButton(
                    child: Text("OutlineButton"),
                    onPressed: _pressed("OutlineButton"),
                  )),
              ButtonToTitleWidget(
                  title: "可点击的Icon，不包括文字，默认没有背景，点击后会出现背景",
                  widget: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: _pressed("IconButton"),
                  )),
              Text("可点击Icon,不包括文字，默认无背景，点击后出现背景"),
              RaisedButton.icon(
                onPressed: _pressed(""),
                label: Text("RaisedButton"),
                icon: Icon(Icons.send),
              ),
              FlatButton.icon(
                  onPressed: _pressed("FlatButton.icon"),
                  icon: Icon(Icons.details),
                  label: Text("FlatButton")),
              OutlineButton.icon(
                  onPressed: _pressed("OutlineButton.icon"),
                  icon: Icon(Icons.call),
                  label: Text("OutlineButton")),

              SizedBox(
                height: 30,
              ),
              //自定义外观
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[600],
                colorBrightness: Brightness.dark,
                //按下颜色
                splashColor: Colors.grey,
                child: Text(
                  "自定义按钮样式",
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: _pressed("一个自定义按钮样式"),
              )
            ],
          ),
        ),
      );
}
