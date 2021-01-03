import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//指定一个或多个子元素相对于父元素各个边的精确偏移，根据widget位置可以进行重叠。
class StackToPositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          //此参数决定如何去对齐没有使用 Positioned 或部分定位的子组件。部分定位指的是 没有在某一个轴上有定位
          alignment: AlignmentDirectional.center,
          //决定alignment方向，如果为ltr,alignment为start代表左，end代表右；如果为rtl，则上述反之，start代表右
          textDirection: TextDirection.rtl,
          //用于确定没有定位的子组件如何去适应 Stack 的大小
          //StackFit.loose 表示使用子组件大小，
          // StackFit.expand 表示未定位的组件扩展到Stack的大小
          fit: StackFit.expand,
          children: [
            Container(child: Text("fit-expand,没有定位大小和Stack一样大",style: TextStyle(color: Colors.white),),color: Colors.blue,),
            Positioned(child: Text("left"),left: 20,width: 100,),
            Positioned(child: Text("top"),top: 50,),
            Positioned(child: Text("在右边"),right: 10,),
          ],
        ),
      );
}
