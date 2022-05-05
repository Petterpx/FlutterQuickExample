import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextStyle textStyle = const TextStyle(fontFamily: 'FangSong');

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child: Column(
        // TODO: 2020/12/13 这里的主轴对齐是指
        // TODO: 2020/12/13 对于整个Widget而言，依照最大widget所占宽度衡量，即可以理解为，如果某个Widget占满横屏，则对于其他widget而言，将全部默认居中
        mainAxisAlignment: MainAxisAlignment.center,
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

          //TextStyle
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
          ),

          //具有默认样式的Text主题
          DefaultTextStyle(
            style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                decoration: TextDecoration.lineThrough),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("xiajunjun"),
                Text("Petterp"),
                Text("Lvkkk"),
                Text(
                  "JetPack",
                  style: TextStyle(inherit: false, color: Colors.green),
                )
              ],
            ),
          ),

          //使用自定义字体
          Text(
            "这是一个自定义字体测试-哈",
            style:
                TextStyle(height: 10, fontFamily: 'TestFamily', fontSize: 15),
          ),
          Text(
            "这是一个自定义字体测试-哈",
            style: TextStyle(fontFamily: 'FangSong', fontSize: 15),
          )
        ],
      ));
}
