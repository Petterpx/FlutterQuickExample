import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget带右提示文本 */
// ignore: must_be_immutable
class TextToRightWidget extends StatelessWidget {
  late String title;
  late double fontSize;
  late double boxTop;
  late Widget widget;

  TextToRightWidget(
      {Key? key,
      required title,
      boxTop = 15.0,
      required widget,
      fontSize = 16.0})
      : super(key: key) {
    this.title = title;
    this.boxTop = boxTop;
    this.widget = widget;
    this.fontSize = fontSize;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              widget,
              Text(
                title,
                style: TextStyle(fontSize: fontSize),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      );
}
