// @dart=2.9
import 'dart:async';
import 'package:cloud_flutter_app/test/test_form_widget.dart';
import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'actual/tab_navigator.dart';
import 'example/animate_scale.dart';
import 'example/basis_widget_list.dart';
import 'example/my_count.dart';
import 'example/navigator.dart';
import 'example/resource_manager.dart';
import 'example/status_manager.dart';
import 'example/wiget_state_lifecycle.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter-Example-Demo",
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: ListMain(),
  ));
}

// TODO: 2020/10/26 列表ListMain
class ListMain extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Flutter-example-Demo"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          showButtonToPush(context, "计数器", MyCounterHomePage()),
          showButtonToPush(context, "导航器", NavigatorToDemoWidget()),
          showButtonToPush(context, "动画", AnimateApp()),
          showButtonToPush(context, "Tab导航", TabNavigator()),
          showButtonToPush(context, "资源管理", ResourceManager()),
          showButtonToPush(context, "State生命周期", StateLifecycleWidget()),
          showButtonToPush(context, "状态管理", StatusManager()),
          showButtonToPush(context, "常见Widget", BasisWidgetList()),
        ],
      ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterError.onError = (details) {
      logInfo("收集异常----${details.exceptionAsString()}");
      showToast(details.exceptionAsString());
    };
  }
}
