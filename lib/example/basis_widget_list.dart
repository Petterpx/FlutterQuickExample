import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basis_widgets/text_widget.dart';

///
/// 基础组件
/// */

class BasisWidgetList extends StatefulWidget {
  @override
  _BasisWidgetListState createState() => _BasisWidgetListState();
}

class _BasisWidgetListState extends State<BasisWidgetList> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("基础组件"),
        ),
        body: ListView(
          children: <Widget>[
            showSampleStateFulWidget(context, "文本及其样式", TextWidget()),
            showSampleStateFulWidget(context, "按钮", widget),
            showSampleStateFulWidget(context, "图片和Icon", widget),
            showSampleStateFulWidget(context, "复选框及单选框", widget),
            showSampleStateFulWidget(context, "输入框和表单", widget),
            showSampleStateFulWidget(context, "进度指示器", widget),
          ],
        ),
      );
}
