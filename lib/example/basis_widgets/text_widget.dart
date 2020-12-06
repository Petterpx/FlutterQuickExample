import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            Text(
              "普通文本",
              textAlign: TextAlign.left,
            ),
            Text(
              "在 2019 年的 I/O 大会上，我们曾宣布 Kotlin 将会是 Android 应用开发的首选语言，"
              "但是，部分开发者们反馈仍不清楚如何切换到 Kotlin，如果团队中没有人熟悉 Kotlin，一开始直接使用 Kotlin "
              "进行项目开发还是会令人生畏。在 Android Studio Profiler 团队内部，我们是通过几个步骤克服了这个问题，"
              "第一步是要求所有的单元测试使用 Kotlin 编写。",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "放大字体",
              textScaleFactor: 1.5,
            ),
            Text(
              "测试textStyle",
              style: TextStyle(
                  //字体颜色
                  color: Colors.red,
                  //字体大小
                  fontSize: 27,
                  //top高度
                  height: 10,
                  //字体
                  fontFamily: "Courier",
                  //背景色
                  background: Paint()..color = Colors.yellow,
                  //上线
                  decoration: TextDecoration.overline,
                  //虚线
                  decorationStyle: TextDecorationStyle.dashed),
            )
          ],
        ),
      );
}
