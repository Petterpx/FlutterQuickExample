import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:cloud_flutter_app/utils/widget_text_to_button.dart';
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
                  widget: ElevatedButton(
                    child: Text("ElevatedButton"),
                    onPressed: _pressed("ElevatedButton"),
                  )),
              ButtonToTitleWidget(
                  title: "FlatButton 即扁平按钮，默认背景透明并不带阴影，按下后，会有背景色",
                  widget: TextButton(
                    child: Text("FlatButton"),
                    onPressed: _pressed("FlatButton"),
                  )),
              ButtonToTitleWidget(
                  title: "默认有一个边框，不带阴影且背景透明。\n 按下后，边框颜色变透明，同时出现背景和阴影(较弱)",
                  widget: OutlinedButton(
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
              TextButton.icon(
                onPressed: _pressed(""),
                label: Text("ElevatedButton"),
                icon: Icon(Icons.send),
              ),
              TextButton.icon(
                  onPressed: _pressed("FlatButton.icon"),
                  icon: Icon(Icons.details),
                  label: Text("FlatButton")),
              OutlinedButton.icon(
                  onPressed: _pressed("OutlineButton.icon"),
                  icon: Icon(Icons.call),
                  label: Text("OutlineButton")),

              SizedBox(
                height: 30,
              ),
              //自定义外观
              ElevatedButton(
                style: ButtonStyle(),
                child: Text(
                  "自定义按钮样式",
                  style: TextStyle(color: Colors.black),
                ),
                clipBehavior: Clip.antiAlias,
                onPressed: _pressed("一个自定义按钮样式"),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {},
                  child: Text("123123123")),
            ],
          ),
        ),
      );
}
