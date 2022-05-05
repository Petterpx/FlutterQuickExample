import 'package:cloud_flutter_app/example/basis_widgets/title_widget.dart';
import 'package:flutter/material.dart';

/// 尺寸限制类容器 */
class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TitleWidget(
              fontSize: 20,
              title: "ConstrainedBox",
              widget: ConstrainedBox(
                  //minHeight 最小高度，infinity-> 无限大
                  constraints: BoxConstraints(
                      minWidth: 50,
                      maxWidth: double.infinity,
                      minHeight: 50,
                      maxHeight: double.infinity),
                  child: Container(
                    //虽然这里将Container高度设置为了10，但是上面加了最小高度限制为50，所以实际高度为50
                    height: 10,
                    color: Colors.red,
                  ))),
          TitleWidget(
              title: "SizedBox",
              widget: SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.lightBlueAccent,
                ),
              )),
          TitleWidget(
              title: "ConstrainedBox-多重限制",
              // TODO: 1/9/21 当多重限制时，最终的显示由最外层maxXXX而定，对于minXxx,取父子中最大的一个，当然这也很好理解
              widget: ConstrainedBox(
                  //minHeight 最小高度，infinity-> 无限大
                  constraints: BoxConstraints(
                      minWidth: 50,
                      maxWidth: 100,
                      minHeight: 50,
                      maxHeight: double.infinity),
                  child: ConstrainedBox(
                      //minHeight 最小高度，infinity-> 无限大
                      constraints: BoxConstraints(
                          minWidth: 100,
                          maxWidth: double.infinity,
                          minHeight: 100,
                          maxHeight: double.infinity),
                      child: Container(
                        //虽然这里将Container高度设置为了10，但是上面加了最小高度限制为50，所以实际高度为50
                        height: 10,
                        color: Colors.red,
                      )))),
          TitleWidget(
              title: "去除父级限制-UnconstrainedBox",
              widget: ConstrainedBox(
                //minHeight 最小高度，infinity-> 无限大
                constraints: BoxConstraints(minWidth: 100, minHeight: 100),
                child: Container(
                    // TODO: 1/9/21 这里去除了父级最小widget,height=100的限制
                    // TODO: 1/9/21 需要注意的是，这并不是真的限制，相应的父级限制依然存在，这个限制只是对当前子级而言
                    child: UnconstrainedBox(
                        child: ConstrainedBox(
                            //minHeight 最小高度，infinity-> 无限大
                            constraints:
                                BoxConstraints(minWidth: 50, minHeight: 50),
                            child: Container(
                              //虽然这里将Container高度设置为了10，但是上面加了最小高度限制为50，所以实际高度为50
                              height: 10,
                              color: Colors.red,
                            ))),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1))),
              ))
        ],
      );
}
