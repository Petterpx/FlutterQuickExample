import 'package:flutter/cupertino.dart';

/// Text增加Box */
// ignore: must_be_immutable
class TextToBoxWidget extends StatelessWidget {
  late String title;
  late double boxTop;
  late double boxBottom;
  late double fontSize;

  TextToBoxWidget(
      {Key? key,
      required title,
      boxTop = 30.0,
      boxBottom = 0.0,
      fontSize = 16.0})
      : super(key: key) {
    this.title = title;
    this.boxTop = boxTop;
    this.boxBottom = boxBottom;
    this.fontSize = fontSize;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: boxTop,
          ),
          Text(
            title,
            style: TextStyle(fontSize: fontSize),
          ),
          SizedBox(
            height: boxBottom,
          )
        ],
      );
}
