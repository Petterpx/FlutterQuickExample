import 'package:cloud_flutter_app/animate_scale_demo.dart';
import 'package:cloud_flutter_app/tab_navigator_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigator_demo.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter-Example-Demo",
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    home: TabNavigator(),
  ));
}
