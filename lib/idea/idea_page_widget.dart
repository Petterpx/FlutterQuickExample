import 'package:cloud_flutter_app/idea/page/visible_animate_simple.dart';
import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/material.dart';

class IdeaPageWidgetList extends StatelessWidget {
  const IdeaPageWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("一些工具"),
      ),
      body: ListView(
        children: [
          showButtonToPush(context, "测试可隐藏动画", VisibleAnimationSimple()),
        ],
      ),
    );
  }
}
