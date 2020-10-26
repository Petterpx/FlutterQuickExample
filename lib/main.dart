import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'actual/tab_navigator.dart';
import 'example/animate_scale.dart';
import 'example/my_count.dart';
import 'example/navigator.dart';
import 'example/resource_manager.dart';


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
          buildItem(context, "计数器", MyCounterHomePage()),
          buildItem(context, "导航器", NavigatorDemo()),
          buildItem(context, "动画", AnimateApp()),
          buildItem(context, "Tab导航", TabNavigator()),
          buildItem(context, "资源管理", ResourceManager()),
        ],
      ));

  Widget buildItem(BuildContext context, String title, Widget widget) =>
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return widget;
          }));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),
      );
}
