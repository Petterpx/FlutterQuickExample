import 'package:cloud_flutter_app/example/basis_widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: ListView(
          children: [
            TitleWidget(
              title: "示例",
              widget: Container(
                color: Colors.black,
                child: Transform(
                    //相对于坐标系原点的对其方式
                    alignment: Alignment.topLeft,
                    //沿y轴倾斜0.3弧度
                    transform: Matrix4.skewY(0.3),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text("我有一点焦虑,我对自己很迷茫"),
                    )),
              ),
            ),
            TitleWidget(
              sizeBox: 100.0,
              title: "Transform.rotate(平移示例)",
              widget: Container(
                color: Colors.black,
                child: Transform.translate(
                    //默认原点为左上角，左移20像素，向下平移20像素
                    offset: Offset(-20, 20),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text("但我相信自己"),
                    )),
              ),
            ),
            TitleWidget(
                sizeBox: 100.0,
                title: "TransForm.rotate(旋转)",
                widget: Container(
                  color: Colors.black,
                  child: Transform.rotate(
                      //旋转90度
                      angle: math.pi / 2,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: const Text("我相信"),
                      )),
                )),
            TitleWidget(
                sizeBox: 100.0,
                title: "TransForm.scale(缩放)",
                widget: Container(
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Transform.scale(
                      //放大1.5倍
                      scale: 1.5,
                      child: Container(
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: const Text("我相信"),
                      )),
                )),
            TitleWidget(
                sizeBox: 100.0,
                title: "RotatedBox",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      //将Transform.rotate换成RotatedBox
                      child: RotatedBox(
                        quarterTurns: 1, //旋转90度(1/4圈)
                        child: Text("Hello world"),
                      ),
                    ),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    )
                  ],
                ))
          ],
        ),
      );
}
