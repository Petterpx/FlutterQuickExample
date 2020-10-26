import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: 2020/10/26 Flutter 动画->从小到大
class AnimateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MyScaleView("animate");
}

class MyScaleView extends StatefulWidget {
  MyScaleView(this.title);

  final String title;

  @override
  _MyScaleChildView createState() => _MyScaleChildView();
}

class _MyScaleChildView extends State<MyScaleView>
    with TickerProviderStateMixin {
  //动画控制器
  //AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值，
  // 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
  AnimationController controller;

  //第一次插入到树时
  @override
  // ignore: must_call_super
  void initState() {
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // curvedAnimation =
    //     ScaleTransition(scale: ,);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ScaleTransition(
            //设置动画的缩放中心
            alignment: Alignment.center,
            scale: controller,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Fade',
          child: Icon(Icons.brush),
          onPressed: () {
            controller.reset();
            controller.forward();
          },
        ),
      );
}
