import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State {
  var isShow = false;


  @override
  void initState() {
    FlutterError.onError = (details) {
      showToast("槽糕，发生同步异常了，具体如下(不过我猜你可能是child已移除，却要更换图片)：\n ${details.exceptionAsString()}");
    };
  }

  GlobalKey<ChildState> childState = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("测试State生命周期"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              showButton("显示child", () {
                setState(() {
                  isShow = true;
                });
              }),
              showButton("移除child", () {
                setState(() {
                  isShow = false;
                });
              }),
              showButton("改变child显示图片-> jenkins", () {
                childState.currentState.updateName("images/jenkins.jpg");
              }),
              isShow ? Child(childState) : Text("已隐藏child")
            ],
          ),
        ),
      );
}

class Child extends StatefulWidget {
  final Key key;

  Child(this.key);

  @override
  ChildState createState() => ChildState();
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
  Widget build(BuildContext context) =>
      Image(width: 200, height: 200, image: AssetImage(image));
}
