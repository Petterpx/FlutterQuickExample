import 'package:cloud_flutter_app/example/basis_widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 进度指示器 */
class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TitleWidget(
              title: "线性进度指示器",
              // TODO: 2020/12/27 默认会按照当前父容器的尺寸来作为绘制边界
              widget: LinearProgressIndicator(
                //当存在进度值时，会展示一个具体进度的进度条，范围[0-1]
                // value: .5,
                //进度条背景色
                backgroundColor: Colors.blue,
                //指示器的进度条颜色,可以设置对进度条颜色设置动画
                valueColor: AlwaysStoppedAnimation(Colors.yellow),
              )),
          TitleWidget(
              title: "圆形进度条",
              widget: CircularProgressIndicator(
                //设置进度条的粗细
                strokeWidth: 1,
              )),
          TitleWidget(
              title: "自定义大小的圆形进度条",
              widget: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              )),
          TitleWidget(title: "进度条带颜色变化的进度条", widget: ProgressRoute())
        ],
      );
}

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

/// 自定义进度条颜色变化 */
class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //reverse=true反向重复，即动画先正向，再反向，往复循环
    _animationController.repeat(reverse: false);
    _animationController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                valueColor: ColorTween(begin: Colors.blue, end: Colors.grey)
                    .animate(_animationController),
                value: _animationController.value,
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
