import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerWidgetSimple extends StatelessWidget {
  const ScrollControllerWidgetSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            showButtonToPush(context, "滚动监听", ScrollControllerTestRoute())
          ],
        ),
      );
}

// 滚动监听
class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({Key? key}) : super(key: key);

  @override
  _ScrollControllerTestRoute createState() => _ScrollControllerTestRoute();
}

class _ScrollControllerTestRoute extends State<ScrollControllerTestRoute> {
  ScrollController _controller =
      ScrollController(initialScrollOffset: 20, keepScrollOffset: true);

  //是否显示返回到顶部按钮
  bool showToTopBtn = false;

  @override
  void initState() {
    // 添加一个滚动监听器
    _controller.addListener(() {
      //打印滚动位置
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("滚动控制"),
        ),
        body: Scrollbar(
          child: ListView.builder(
              primary: false,
              //用于恢复滚动位置
              key: PageStorageKey(1),
              itemCount: 100,
              itemExtent: 50.0,
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
               }),
        ),
        floatingActionButton: !showToTopBtn
            ? null
            : FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  //返回到顶部时执行动画
                  _controller.animateTo(.0,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.ease);
                }),
      );
}

// PageStorage
// PageStorage是一个用于保存页面(路由)相关数据,其并不对UI外观造成影响，只是一个功能组件
// 其拥有一个存储桶 bucket,子widget可以通过指定不同的 PageStorageKey 存储各自的数据或者状态
///
/// 每次滚动结束时，可滚动组件都会将滚动位置 offset 存储到 PageStorage中,当可滚动组件重新创建时再回复。
/// ScrollController.keepScrollOffset ->
/// false 滚动位置将不会被存储.
///
/// ScrollController.initialScrollOffset ->
/// true 会在第一次创建时，滚动到初始化位置,因为这是还没存储过滚动位置，接下来的滚动中就会有存储、恢复滚动位置，
/// initialScrollOffset 也会被忽略。
///
/// */
