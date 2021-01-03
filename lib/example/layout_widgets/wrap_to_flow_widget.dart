import 'package:cloud_flutter_app/utils/widget_text_to_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Wrap Flow -> 流式布局*/
class WrapToFlowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextToBoxWidget(
            title: "Wrap",
            fontSize: 30.0,
          ),
          Wrap(
            //主轴方向 子Widget的间距
            spacing: 40,
            //纵轴方向的间距
            runSpacing: 10,
            //纵轴方向的对其方式
            runAlignment: WrapAlignment.center,
            //沿主轴方向居中
            alignment: WrapAlignment.center,
            children: [
              Chip(
                label: Text("Android"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("A"),
                ),
              ),
              Chip(
                label: Text("ios"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("B"),
                ),
              ),
              Chip(
                label: Text("Flutter"),
                backgroundColor: Colors.blue,
              ),
              Chip(
                label: Text("C++"),
                backgroundColor: Colors.blue,
              ),
              Chip(
                label: Text("996"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          TextToBoxWidget(
            title: "Flow",
            fontSize: 30.0,
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.red,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.blue,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.grey,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.green,
              )
            ],
          )
        ],
      );
}

/// 测试的Flow */
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({required this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子Widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      //如果当前widget小于给定的widget大小
      if (w < context.size.width) {
        //绘制子widget
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子Widget
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
