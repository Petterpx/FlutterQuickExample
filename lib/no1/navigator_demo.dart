import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//路由相关-demo
class NavigatorDemo extends StatefulWidget {
  @override
  _naivgateDemo createState() => _naivgateDemo();
}

// ignore: camel_case_types
class _naivgateDemo extends State {
  var centerTitle = "准备接收返回的数据";

  _updateCenterTitle(String title) {
    setState(() {
      centerTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("One Page")),
        body: Center(
          child: Text(centerTitle),
        ),
        floatingActionButton: FloatingActionButton(
          //接收回传的数据
          onPressed: () async {
            var result = await Navigator.push<String>(context,
                MaterialPageRoute(builder: (context) {
              return TwoPage();
            }));
            _updateCenterTitle(result);
          },
          child: Icon(Icons.arrow_right),
        ),
      );
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Two Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              //返回数据回去
              Navigator.of(context).pop("我是返回的数据");
            },
          ),
        ),
        body: Center(
          child: Text("This is Intent Test"),
        ),
      );
}
