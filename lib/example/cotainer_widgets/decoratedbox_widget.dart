import 'package:flutter/material.dart';

///
/// 装饰容器Widget
/// */
class DecoratedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DecoratedBox(
        //DecoratedBox的一个子类，
        decoration: BoxDecoration(
            //渐变色
            gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
            //圆角
            borderRadius: BorderRadius.circular(3.0),
            //背景混合模式
            // backgroundBlendMode:BlendMode.dst ,
            //背景色，如果存在gradient,则忽略这个属性
            color: Colors.blueGrey,
            //阴影
            boxShadow: [
              BoxShadow(
                  color: Colors.blue, offset: Offset(2.0, 2.0), blurRadius: 4.0)
            ],
            //形状，当circle时，和borderRadius不能共存
            shape: BoxShape.rectangle),
        //决定在哪里绘制Decoration,background 背景装饰，foreground前景装饰，即绘制在子组件之上
        position: DecorationPosition.background,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: Text(
            "test",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
