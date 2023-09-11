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
                return SizeTransition(
                      sizeFactor: animation,
                      axisAlignment: 0.0,
                      child: buildItem(context, index),
                    );
              }),
          buildAddBtn2(),
        ],
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

  Widget buildAddBtn() => Positioned(
        child: FloatingActionButton(
            child: Icon(Icons.add_alarm),
            onPressed: () {
              data.add('${++counter}');
              globalKey.currentState!.insertItem(data.length - 1);
              print('添加 $counter');
            }),
        bottom: 30,
        left: 0,
        right: 0,
      );

  Widget buildAddBtn2() => Positioned(
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              data.insert(0, '${++counter}');
              globalKey.currentState!.insertItem(0);
              print('添加 $counter');
            }),
        bottom: 30,
        left: 150,
        right: 0,
      );


  void onDelete(context, index) {
    data.remove(index);
    globalKey.currentState!.removeItem(index, (context, animation) {
      // 删除过程执行的是反向动画，animation.value 会从1变为0
      var item = buildItem(context, index);
      print('删除 ${data[index]}');
      data.removeAt(index);
      // 删除动画是一个合成动画：渐隐 + 收缩列表项
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          //让透明度变化的更快一些
          curve: const Interval(0.5, 1.0),
        ),
        // 不断缩小列表项的高度
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0.0,
          child: item,
        ),
      );
    }, duration: Duration(milliseconds: 200));
  }
}
