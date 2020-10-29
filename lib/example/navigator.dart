import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: 2020/10/26 路由导航相关-demo
class NavigatorDemo extends StatefulWidget {
  @override
  _naivgateDemo createState() => _naivgateDemo();
}

// ignore: camel_case_types
class _naivgateDemo extends State {
  var centerTitle = "This is OnePage";

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

class TwoPage extends StatefulWidget {
  _TwoPage createState() => _TwoPage();
}

class _TwoPage extends State {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Two Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              //返回数据回去
              // Navigator.of(context).pop("我是返回的数据");
              //是否可以返回回去
              Navigator.maybePop(context, "ceshi1");
              // print(isCanPop);
            },
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CustomButton("maybePop", () {
                Navigator.maybePop(context, "test");
              }),
              CustomButton("canPop", () {
                bool isCanPop = Navigator.canPop(context);
                showToast("是否可关闭$isCanPop");
              }),
              CustomButton("pushNamed", () {
                //导航到指定页面
                showToast("测试->xx");
                Navigator.pushNamed(context, "xxx");
              }),
              CustomButton("pop", () {
                Navigator.maybePop(context, "test");
              }),
              CustomButton("removeRoute", () {
                showToast("清除指定路由，同时释放资源");
              }),
              CustomButton("removeRouteBelow", () {
                showToast("清除指定路由下的路由，同时释放其资源");
              }),
              CustomButton("replace", () {
                showToast("将Navigator中指定的路由替换为新的路由");
              }),
              CustomButton("replaceRouteBelow", () {
                showToast("将Navigator中指定的路由下的路由替换为新的路由");
              })
            ],
          ),
        ),
      );
}
