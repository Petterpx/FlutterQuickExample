import 'package:cloud_flutter_app/example/basis_widgets/title_widget.dart';
import 'package:cloud_flutter_app/utils/widget_text_to_box.dart';
 
import 'package:flutter/material.dart';

/// Row与Column*/
/// // TODO: 2020/12/27 注意，如果子Widget超出屏幕范围，就会报溢出错误
class RowToColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TitleWidget(
              title: "Row",
              fontSize: 30,
              widget: Row(
                //文本文字从左到右，默认按照当前语言而定
                textDirection: TextDirection.ltr,
                //横向占用空间大小，max最大，min自适应
                mainAxisSize: MainAxisSize.max,
                //子widget对其方式，min时无意义，max时，center[居中].xxxx
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //垂直对其方向，默认down,即从上到下。[注意这里的垂直指的不是多行，而是根据Widget不同的大小而导致的落差时的垂直对其]
                verticalDirection: VerticalDirection.up,
                //子Widget在横轴的对其方式，
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("123"),
                    ),
                  ),
                  Text("测试方向居中")
                ],
              )),
          TextToBoxWidget(
            title: "Column",
            fontSize: 30.0,
          ),
          // TODO: 2020/12/27 在Column嵌套的情况下，内部Column尽管是max,但也无法充满屏幕，这个时候就可以使用Expand
          Expanded(
            child: Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("子Widget占满"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
