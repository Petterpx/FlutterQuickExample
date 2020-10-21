import 'package:cloud_flutter_app/no1/navigator_demo.dart';
import 'package:cloud_flutter_app/no1/tab_navigator_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'no1/animate_scale_demo.dart';
import 'no1/MyCounterDemo.dart';

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
