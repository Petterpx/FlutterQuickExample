import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 弹性布局
/// 弹性布局允许子组件按照一定比例来分配父容器空间。 如Android中的 widget
/// */
class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200,
        child: Row(
          children: [
            Expanded(
                child: Container(
              color: Colors.red,
            )),
            Expanded(
                child: Container(
              color: Colors.grey,
            )),
            Expanded(
                child: Container(
              color: Colors.blue,
            ))
          ],
        ),
      );
}
