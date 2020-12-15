import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///  状态管理示例
///  */
  class StatusManager extends StatefulWidget {
  @override
  _StatusManagerState createState() => _StatusManagerState();
}

class _StatusManagerState extends State<StatusManager> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("状态管理示例"),
        ),
        body: ListView(
          children: <Widget>[
            showButtonToPush(context, "widget自己管理自己", WidgetManager()),
            showButtonToPush(context, "父widget管理子widget", WidgetAtoB()),
            showButtonToPush(context, "混合管理", ParentWidget()),
          ],
        ),
      );
}

// TODO: 2020/11/1 Widget自己管理自己
class WidgetManager extends StatefulWidget {
  @override
  _WidgetManagerState createState() => _WidgetManagerState();
}

class _WidgetManagerState extends State<WidgetManager> {
  var _active = false;

  _hanTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: _hanTap,
      child: Scaffold(
        appBar: AppBar(
          title: Text("widget自己管理自己"),
        ),
        body: Center(
            child: Container(
          child: Center(
            child: Text(
              _active ? "Active" : "Inactive",
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ),
          width: 200,
          height: 200,
          decoration:
              BoxDecoration(color: _active ? Colors.lightGreen : Colors.grey),
        )),
      ));
}

// TODO: 2020/11/1 父Widget管理子Widget
class WidgetAtoB extends StatefulWidget {
  @override
  _WidgetAtoBState createState() => _WidgetAtoBState();
}

class _WidgetAtoBState extends State<WidgetAtoB> {
  var _active = false;

  _handleTapBoxChanged(bool newValue) => setState(() {
        _active = !_active;
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("父Widget管理子Widget"),
        ),
        body: WidgetB(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ),
      );
}

class WidgetB extends StatelessWidget {
  WidgetB({this.active: false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() => onChanged(!active);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration:
            BoxDecoration(color: active ? Colors.lightGreen : Colors.grey),
      ));
}

// TODO: 2020/11/3 混合状态管理
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

/// 父Widget管理方块颜色改变 */
class _ParentWidgetState extends State<ParentWidget> {
  //方块颜色是否改变
  bool _active = false;

  _handleTapBoxChanged() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: WidgetC(
            active: _active,
            //这里相当于传递了一个函数引用
            onChanged: _handleTapBoxChanged,
          ),
        ),
        appBar: AppBar(
          title: Text("混合状态管理"),
        ),
      );
}

/// 子Widget控制外部边框显示状态 */
class WidgetC extends StatefulWidget {
  WidgetC({this.active: false, required this.onChanged});

  final bool active;
  final Function onChanged;

  @override
  _WidgetCState createState() => _WidgetCState();
}

class _WidgetCState extends State<WidgetC> {
  //控制框外部是否显示
  bool _isHighlight = false;

  //手指按下
  _handleTapDown(TapDownDetails details) {
    setState(() {
      //显示外部框
      _isHighlight = true;
    });
  }

  //手指放开
  _handleTapUp(TapUpDetails details) {
    setState(() {
      //隐藏外部框
      _isHighlight = false;
    });
  }

  //手指取消
  _handleTapCancel() {
    setState(() {
      _isHighlight = false;
    });
  }

  //控制父widget
  _handleTap() {
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加红色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _isHighlight
              ? new Border.all(
                  color: Colors.red[700]!,
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
