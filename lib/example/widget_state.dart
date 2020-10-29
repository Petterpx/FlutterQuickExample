import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Widget示例
/// */
class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State {
  var isShow = false;
  GlobalKey<ChildState> childState = GlobalKey();

  @override
  void initState() {
    FlutterError.onError = (details) {
      logInfo("收集异常----${details.exceptionAsString()}");
      showToast(
          "槽糕，发生同步异常了，具体如下(不过我猜你可能是child已移除，却更换图片 👻 )： ${details.exceptionAsString()}");
    };
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("测试State生命周期"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CustomButton("显示child", () {
                logInfo("点击-> 显示child");
                setState(() {
                  isShow = true;
                });
              }),
              CustomButton("移除child", () {
                logInfo("点击-> 移除child");
                setState(() {
                  isShow = false;
                });
              }),
              SizedBox(height: 8),
              CustomButton("改变child显示图片-> jenkins", () {
                logInfo("点击-> 改变child显示图片");
                childState.currentState.updateName("images/jenkins.jpg");
              }),
              isShow ? Child(childState) : Text("已隐藏child")
            ],
          ),
        ),
      );
}

/// 需要动态显示的Child,示例state */
class Child extends StatefulWidget {
  final Key key;

  Child(this.key);

  @override
  ChildState createState() => ChildState();

  static of(BuildContext context) {
    return context.findAncestorStateOfType<ChildState>();
  }
}

class ChildState extends State {
  String image = "images/icon.png";

  updateName(String image) {
    setState(() {
      this.image = image;
    });
  }

  @override
  void initState() {
    logInfo("initState----我初始化了");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    logInfo("didChangeDependencies------State发生变化");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    logInfo("reassemble-----热重载");
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    logInfo("didUpdateWidget------重新构建时，发现，新旧widget相同");
    showToast("重复构建啦，触发-didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    logInfo("deactivate------state已被移除");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    logInfo("dispose-------彻底移除state,通常对应页面销毁");
  }

  @override
  Widget build(BuildContext context) {
    logInfo("build-----开始构建Widget");
    return Image(width: 200, height: 200, image: AssetImage(image));
  }
}

class FindAncestorScaffold extends StatefulWidget {
  @override
  FindAncestorScaffoldState createState() => FindAncestorScaffoldState();
}

class FindAncestorScaffoldState extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("子树中获取 state 对象"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CustomButton("findAncestorStateOfType", () {
                //查找父级最近的 Scaffold  对应的ScaffoldState对象。
                ScaffoldState _state =
                    context.findAncestorStateOfType<ScaffoldState>();
                _state.showSnackBar(SnackBar(
                  content: Text("使用 findAncestorStateOfType 获取state"),
                ));
              }),
              CustomButton("of静态方法", () {
                ScaffoldState _state = Scaffold.of(context);
                _state.showSnackBar(SnackBar(
                  content: Text("使用Scaffold.of(context)获取state"),
                ));
              })
            ],
          ),
        ),
      );
}
