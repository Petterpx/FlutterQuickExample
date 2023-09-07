import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  const AnimatedListRoute({Key? key}) : super(key: key);

  @override
  _AnimatedListRoute createState() => _AnimatedListRoute();
}

class _AnimatedListRoute extends State<AnimatedListRoute> {
  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (int i = 0; i < counter; i++) {
      data.add('${i + 1}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedList(
              key: globalKey,
              initialItemCount: data.length,
              itemBuilder: (context, index, animation) {
                // 添加列表项时会执行渐显动画
                return FadeTransition(
                    opacity: animation, child: buildItem(context, index));
              }),
          buildAddBtn()
        ],
      );

  Widget buildAddBtn() => Positioned(
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              data.add('${++counter}');
              globalKey.currentState!.insertItem(data.length - 1);
              print('添加 $counter');
            }),
        bottom: 30,
        left: 0,
        right: 0,
      );

  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
        key: ValueKey(char),
        title: Text(char),
        trailing: IconButton(
            onPressed: () => {onDelete(context, index)},
            icon: Icon(Icons.delete)));
  }

  void onDelete(context, index) {}
}
