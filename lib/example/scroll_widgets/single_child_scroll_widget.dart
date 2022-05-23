import 'package:flutter/material.dart';

///
///  类似Android中的 ScrollView,只能接收一个子组件
/// 适用场景：内容不会超过屏幕太多时使用,
/// 原因是，其不支持基于Sliver的延迟加载模型，如果预计的视口包含超出屏幕尺寸太多的内容，性能就会很差
///  */
class SingleChildScrollWidget extends StatelessWidget {
  const SingleChildScrollWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDDASDASDasdanksdasdasdasdasdASDASD";
    // 使用Scrollbar 包裹，可以增加进度条
    return Scrollbar(
        child: SingleChildScrollView(
            //表示使用widget中默认的PrimaryScrollController
            // MaterialApp 组件树中默认包含了一个PrimaryScrollController
            child: Center(
      child: Column(
          children: str
              .split("")
              .map((e) => Text(
                    e,
                    textScaleFactor: 2.0,
                  ))
              .toList()),
    )));
  }
}
