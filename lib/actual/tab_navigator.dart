import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

//简单的Tab页-实践
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  //未点击状态的颜色
  final _defaultColor = Colors.grey;

  //点击状态的颜色
  final _activeColor = Colors.blue;

  //当前index下标
  int _currentIndex = 0;

  //页面控制器
  final _controller = PageController(initialPage: 0);

  //滑动监听
  void _pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Tab-Navigator"),),
    body: PageView(
      onPageChanged: _pageChanged,
      controller: _controller,
      children: <Widget>[
        BaseItemPage('首页'),
        BaseItemPage('搜索'),
        BaseItemPage('拍照'),
        BaseItemPage('我的'),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      //当前选中的
      currentIndex: _currentIndex,
      //点击时调用
      onTap: (index) {
        _controller.jumpToPage(index);
        setState(() {
          _currentIndex = index;
        });
      },
      //fixed 固定tab不变，shifting 随着点击变化
      type: BottomNavigationBarType.shifting,
      items: [
        getBottomItem('首页', Icons.home, _defaultColor, _activeColor,
            _currentIndex, 0),
        getBottomItem('搜索', Icons.search, _defaultColor, _activeColor,
            _currentIndex, 1),
        getBottomItem('拍照', Icons.photo, _defaultColor, _activeColor,
            _currentIndex, 2),
        getBottomItem('我的', Icons.account_circle, _defaultColor,
            _activeColor, _currentIndex, 3)
      ],
    ),
  );
}

BottomNavigationBarItem getBottomItem(String title, IconData iconData,
    Color defaultColor, Color activeColor, int currentIndex, int index) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: defaultColor,
      ),
      activeIcon: Icon(
        iconData,
        color: activeColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: currentIndex != index ? defaultColor : activeColor),
      ));
}

class BaseItemPage extends StatefulWidget {
  final String title;

  BaseItemPage(this.title);

  @override
  _BaseItemPageState createState() => _BaseItemPageState(title);
}

class _BaseItemPageState extends State<BaseItemPage> {
  final String title;

  _BaseItemPageState(this.title); //页面控制器

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(title),
    ),
  );
}
