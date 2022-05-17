import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  ScaffoldRoute({Key? Key}) : super(key: Key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        leading: Builder(
            builder: ((context) => IconButton(
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showToast("点击了菜单栏");
                    Scaffold.of(context).openDrawer();
                  },
                ))),
        actions: [
          IconButton(
              onPressed: () {
                showToast("点击了右侧的分享");
              },
              icon: Icon(Icons.share))
        ],
        // 底部阴影
        elevation: 5.0,
        // 标题是否居中
        centerTitle: true,
      ),
      // 抽屉
      drawer: MyColumn(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        // 底部导航栏打一个圆形的洞
        shape: CircularNotchedRectangle(),
        child: Row(
          // 均分底部导航栏横向空间
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  _onItemTapped(1);
                },
                icon: Icon(Icons.home)),
            SizedBox(),
            IconButton(
                onPressed: () {
                  _onItemTapped(3);
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //"悬浮按钮"
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      // body: TabBarView(
      //     controller: TabController(length: 3, vsync:),
      //     children: [
      //       Center(
      //         child: Text("1"),
      //       ),
      //       Center(
      //         child: Text("2"),
      //       ),
      //       Center(
      //         child: Text("3"),
      //       )
      //     ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {
    showToast("点击了add");
  }

  Widget MyColumn() => Drawer(
          child: MediaQuery.removePadding(
        context: context,
        // 移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ClipOval(
                      child: Image.asset(
                    "images/icon.png",
                    width: 80,
                  )),
                ),
                Text(
                  "Petterp",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )),
      ));
}
