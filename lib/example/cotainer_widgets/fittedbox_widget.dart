import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 空间适配 FittedBox
/// https://book.flutterchina.club/chapter5/fittedbox.html
/// FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，
/// 即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。
/// FittedBox 对子组件布局结束后就可以获得子组件真实的大小。
/// FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示。
/// */
class FittedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: ListView(
          children: [
            // Padding(
            //     padding: const EdgeInsets.all(10),
            //     //文本长度超出Row的最大宽度会溢出
            //     child: Row(
            //       children: [Text('xx' * 30)],
            //     )),
            Text("使用FittedBox解决溢出问题"),
            customContainer("BoxFit.contain-自适应在父组件", BoxFit.contain),
            customContainer("BoxFit.fitHeight-按照当前组件高度适配", BoxFit.fitHeight),
            customContainer("BoxFit.fill-无视父组件限制", BoxFit.fill),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "fitHeight-按照当前组件高度适配按照当前组件高度适配",
                style: TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
              ),
            ),
            Text("使用FittedBox"),
            UnconstrainedBox(child: Container(
                width: 100,
                height: 100,
                child:Text("按照当前组件高度适配按照当前组件高度适配按照当前组件高度适配按照当前组件高度适配")
            ),),
            FittedBox(
              child: simpleSingleWidget(),
            ),
            SingleLineFittedBox(
              child: simpleSingleWidget(),
            )
          ]
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: e,
                  ))
              .toList(),
        ),
      );

  Widget customContainer(String title, BoxFit fit) => Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(title),
            Container(
              width: 100,
              color: Colors.red,
              height: 100,
              child: FittedBox(
                fit: fit,
                child: Container(
                  width: 200,
                  height: 150,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );

  Widget simpleSingleWidget() {
    Text textWidget = Text(
        "asndjaksndajksdaasndjaksndajksdaasndjaksndajksdaasndjaksndajksda");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [textWidget, textWidget, textWidget],
    );
  }
}

/// 类似FittedBox的组件 */
class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
              //maxWidth: constraints.maxWidth
            ),
            child: child,
          ),
        );
      },
    );
  }
}
