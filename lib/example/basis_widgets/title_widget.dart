import 'package:flutter/cupertino.dart';

/// 一个增加了title的Widget */
// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  late Widget widget;
  late String title;
  var sizeBox = 30.0;

  TitleWidget(
      {Key? key, required String title, required Widget widget, sizeBox = 30.0})
      : super(key: key) {
    this.sizeBox = sizeBox;
    this.title = title;
    this.widget = widget;
  }

  @override
  Widget build(BuildContext context) =>
      Column(
        children: <Widget>[
          SizedBox(
            height: sizeBox,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          widget
        ],
      );
}