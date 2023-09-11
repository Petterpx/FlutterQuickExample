import 'package:cloud_flutter_app/utils/animation/animate_size_widget.dart';
import 'package:flutter/material.dart';

class VisibleAnimationSimple extends StatefulWidget {
  const VisibleAnimationSimple({super.key});

  @override
  State<VisibleAnimationSimple> createState() => _VisibleAnimationSimpleState();
}

class _VisibleAnimationSimpleState extends State<VisibleAnimationSimple> {
  var _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画测试"),
        ),
        body: Column(
          children: [
            AnimateSizeWidget(
              toDown: _visible,
              child: Container(
                width: 200,
                height: 50,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              color: Colors.red,
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Future.delayed(Duration(milliseconds: 300), () {
              setState(() {
                _visible = !_visible;
              });
            });
          },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ));
  }
}
