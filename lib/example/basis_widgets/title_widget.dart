import 'package:flutter/cupertino.dart';

/// 一个增加了title的Widget */
// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  late Widget widget;
  late String title;
  var sizeBox;
  late double fontSize;

  TitleWidget(
      {Key? key,
      required this.title,
      required this.widget,
      this.sizeBox = 30.0,
      this.fontSize = 16.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          SizedBox(
            height: sizeBox,
          ),
          Text(
            title,
            style: TextStyle(fontSize: this.fontSize),
          ),
          SizedBox(
            height: 5,
          ),
          widget
        ],
      );
}
