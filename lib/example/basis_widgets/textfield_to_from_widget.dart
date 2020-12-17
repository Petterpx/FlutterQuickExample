import 'package:cloud_flutter_app/example/basis_widgets/button_widget.dart';
import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 输入框及表单 */
class TextFieldToFromWidget extends StatefulWidget {
  @override
  _TextFieldToFromWidgetState createState() => _TextFieldToFromWidgetState();
}

class _TextFieldToFromWidgetState extends State<TextFieldToFromWidget> {
  TextEditingController controller = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? _focusScopeNode;

  /// 监听焦点改变 */
  listenerFocus() {
    // TODO: 2020/12/17 注意focusNode需要添加在TextField(focusNode:x)
    showToast(focusNode1.hasFocus ? "焦点存在" : "焦点不存在");
  }

  /// 移动焦点 */
  mobileFocus() {
    //方式1
    FocusScope.of(context).requestFocus(focusNode2);

    // 方式2
    // if (_focusScopeNode == null) {
    //   _focusScopeNode = FocusScope.of(context);
    // }
    // _focusScopeNode?.requestFocus(focusNode2);
  }

  /// 移除焦点-> 当移除所有焦点，就相当于隐藏键盘 */
  clearFocus() {
    focusNode1.unfocus();
    focusNode2.unfocus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TODO: 2020/12/17 方式2
    controller.addListener(() {
      print('通过addListener监听---${controller.text}');
    });
    //设置默认文本
    controller.text = "Hello World";
    //baseOffset-偏移位置， extentOffset
    controller.selection =
        TextSelection(baseOffset: 2, extentOffset: controller.text.length);
  }

  // TODO: 2020/12/17 使用主题默认色
  @override
  Widget build(BuildContext context) => Theme(
      data: Theme.of(context).copyWith(
          hintColor: Colors.yellow, inputDecorationTheme: InputDecorationTheme(
      )),
      child: Column(
        children: [
          TextField(
            //自动获取焦点
            autofocus: true,
            focusNode: focusNode1,
            //设置输入框默认键盘类型
            keyboardType: TextInputType.number,
            // TODO: 2020/12/17 方式1：通过onChanged自己记录
            onChanged: (value) {
              print("通过onChanged监听--$value");
            },
            //编辑器的控制器，通过它可以设置获取编辑器内容，监听编辑本文改变
            controller: controller,
            //用于控制TextField外观显示，如文本，背景色，边框等
            decoration: InputDecoration(
                labelText: "输入名字",
                hintText: "我是一个提示",
                //未获得焦点时
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 5)),
                //获得焦点时
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
                prefixIcon: Icon(Icons.verified_user)),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
                labelText: "我是测试2",
                hintText: "我是第二个测试",
                prefixIcon: Icon(Icons.access_time)),
          ),
          RaisedButton(
            // TODO: 2020/12/17 移动焦点
            onPressed: mobileFocus,
            child: Text("移动焦点"),
          ),
          RaisedButton(
            // TODO: 2020/12/17 移除焦点
            onPressed: clearFocus,
            child: Text("移除焦点"),
          ),
          RaisedButton(
            // TODO: 2020/12/17 移除焦点
            onPressed: listenerFocus,
            child: Text("输入框1是否依然存在焦点"),
          )
        ],
      ));
}
