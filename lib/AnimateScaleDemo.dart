import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Flutter 动画->从小到大
class AnimateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: "Animate-app",
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: MyScaleView("Animate Demo"),
  );
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
  AnimationController controller;
  ScaleTransition curvedAnimation;

  //第一次插入到树时
  @override
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
