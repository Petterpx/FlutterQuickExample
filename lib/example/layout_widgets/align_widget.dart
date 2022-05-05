// TODO: 1/3/21 用于更简便的调整一个子元素在父元素中的位置
 
import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            color: Colors.blueGrey,
            child: Align(
                //用于确定 Align 组件本身宽高的属性，为两个缩放因子，会分别乘以子元素的宽/高 ，最终结果就是 Align 组件的宽高
                // TODO: 1/3/21 注意：如果值为null,则组件的宽高将会占用尽可能多的空间。
                widthFactor: 2,
                heightFactor: 2,
                //表示子组件在父组件中的起始位置
                // TODO: 1/3/21 Alignment以矩形的中心点(0.0,0.0)作为坐标原点
                // TODO: 其中偏移数值 x,y的值分别从 -1 到 1.其代表矩形左边到右边的距离和顶部到底部的距离
                // TODO: 结合公式为 (Alignment.x*childWidth/2 + childWidth/2, Alignment.y*childHeight/2 + childHeight/2)
                // TODO: 简化可理解为 (0.0)时偏移为childxxx/2 ， >0时，取 childxxx/2 * (alignment.x+1)
                // 其中 Alignment(2,0.0) 这种表示方式，相当于偏移距离为(90,30)
                // Alignment.center 相当于Alignment(0.0,0.0) 相当于(30,30),默认即为center
                alignment: Alignment.center,
                child: FlutterLogo(size: 60)
                // TODO: 1/3/21 所以上述 Align 的实际宽高为 120
                ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 120,
            width: 120,
            color: Colors.blueGrey,
            child: Align(
              // TODO: 1/3/21 FractionalOffset的坐标原点为矩形的左侧顶点，即(0.0,0.0),所以(1,1)代表右下角,(1，0)代表右上角
              // FractionalOffset(0.5,0.5) 相当于 FractionalOffset.center 即居中
              alignment: FractionalOffset.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          )
        ],
      );
}
