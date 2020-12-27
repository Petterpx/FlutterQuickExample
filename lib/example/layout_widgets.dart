import 'package:cloud_flutter_app/example/layout_widgets/row_widget.dart';
import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("布局类组件")),
        body: Column(
          children: [
            showSampleStateFulWidget(
                context, "线性布局Row,Column", RowWidget())
          ],
        ),
      );
}
