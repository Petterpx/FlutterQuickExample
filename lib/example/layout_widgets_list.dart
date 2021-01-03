import 'package:cloud_flutter_app/example/layout_widgets/row_to_column_widget.dart';
import 'package:cloud_flutter_app/example/layout_widgets/stack_to_positioned_widget.dart';
import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'layout_widgets/align_widget.dart';
import 'layout_widgets/flex_widget.dart';
import 'layout_widgets/wrap_to_flow_widget.dart';

///
///  布局类组件Widget
///  */
class LayoutWidgetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("布局类组件")),
        body: Column(
          children: [
            showSampleStateFulWidget(context, "线性布局Row,Column", RowToColumnWidget()),
            showSampleStateFulWidget(context, "弹性布局Expand", FlexWidget()),
            showSampleStateFulWidget(context, "流式布局 wrap,flow", WrapToFlowWidget()),
            showSampleStateFulWidget(context, "层叠布局 Stack,Positioned", StackToPositionedWidget()),
            showSampleStateFulWidget(context, "对齐与相对定位 Align", AlignWidget())
          ],
        ),
      );
}
