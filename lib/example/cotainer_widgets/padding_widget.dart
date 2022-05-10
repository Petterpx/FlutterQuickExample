import 'package:flutter/material.dart';

///
/// PaddingWidget
/// */
class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => container();

  Widget container() {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white70,
      child: Padding(
        //所有方向均使用
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              //左边添加8像素
              padding: EdgeInsets.only(left: 8.0),
              child: Text("hello word"),
            ),
            Padding(
              //左边添加8像素，上边添加20像素
              padding: EdgeInsets.only(left: 8.0, top: 20),
              child: Text("Flutter UI"),
            ),
            Padding(
              //上下各添加8像素
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("symmetric-对称方向填充"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("only-具体某个方向填充"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
              child: Text("fromLTRB-指定四个方向"),
            ),
          ],
        ),
      ),
    );
  }
}
