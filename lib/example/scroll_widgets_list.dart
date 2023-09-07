import 'package:cloud_flutter_app/example/scroll_widgets/animated_list_simple.dart';
import 'package:cloud_flutter_app/example/scroll_widgets/list_view_widget.dart';
import 'package:cloud_flutter_app/example/scroll_widgets/scroll_controller_simple.dart';
import 'package:cloud_flutter_app/example/scroll_widgets/single_child_scroll_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/util_view.dart';

/// slive布局
/// https://book.flutterchina.club/chapter6/intro.html#_6-1-1-sliver%E5%B8%83%E5%B1%80%E6%A8%A1%E5%9E%8B
/// */
class ScrollWidgetsList extends StatelessWidget {
  const ScrollWidgetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("可滚动组件"),
        ),
        body: ListView(
          // 滚动方向
          scrollDirection: Axis.vertical,
          // 接收一个ScrollPhysics类型的对象,其决定可滚动组件如何响应用户操作,如用户滑动完抬起手指后，继续执行动画；
          // 或者滑动到边界时，如何显示。
          // 默认情况下，Flutter在不同平台使用不同的ScrollPhysics 对象，对应不同的显示效果。
          // 可以显示指定一个固定的 ScrollPhysics
          physics: null,
          // 控制滚动位置与监听滚动事件
          controller: null,
          children: [
            showSampleStateFulWidget(
                context, "SingleChildScroll", SingleChildScrollWidget()),
            showSampleStateFulWidget(context, "ListView", ListViewWidget()),
            showSampleStateFulWidget(
                context, "滚动监听及控制", ScrollControllerWidgetSimple()),
            showSampleStateFulWidget(
                context, "AnimatedList", AnimatedListRoute())
          ],
        ),
      );
}
