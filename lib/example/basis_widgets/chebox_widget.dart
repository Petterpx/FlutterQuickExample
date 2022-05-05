import 'package:cloud_flutter_app/utils/widget_text_to_title.dart';
import 'package:flutter/material.dart';

/// 单选开关和复选框-Widget */
class CheBoxWidget extends StatefulWidget {
  @override
  _CheBoxWidgetState createState() => _CheBoxWidgetState();
}

class _CheBoxWidgetState extends State<CheBoxWidget> {
  //维护单选开关状态
  bool _switchSelected = true;

  //维护复选框状态
  bool _checkboxSelected = true;

  _switchPress() => (value) => setState(() {
        _switchSelected = value;
      });

  _checkPress() => (value) => setState(() {
        _checkboxSelected = value;
      });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TextToRightWidget(
              title: "switch",
              widget: Switch(
                //未选中状态下轨道颜色
                inactiveTrackColor: Colors.blue,
                //未选中状态拇指颜色
                inactiveThumbColor: Colors.green,
                //选中状态颜色
                activeColor: Colors.red,
                value: _switchSelected,
                onChanged: _switchPress(),
              )),
          TextToRightWidget(
              title: "cheBox",
              widget: Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red,
                  onChanged: _checkPress()))
        ],
      );
}
