import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            showButtonToPush(context, "simpleListView", simpleListView()),
            showButtonToPush(
                context, "ListView.Builder", simpleListViewBuilder()),
            showButtonToPush(context, "ListView.separated", simpleSeparated()),
          ],
        ),
      );

  Widget simpleListView() => SampleStateFulWidget(
      ListView(
        // 子item的高度，指定了这个高度，便于列表在构建时知道组件具体高度，从而省去滚动位置频繁变化时的计算
        itemExtent: 100,
        // 如果我们知道列表中的所有列表项长度都相同但不知道具体是多少，这时候我们可以指定一个列表项(类似于骨架屏)
        prototypeItem: null,
        // 是否根据子组件的总长度来设置ListView的长度
        shrinkWrap: false,
        addAutomaticKeepAlives: true,
        //该属性表示是否将列表项（子组件）包裹在RepaintBoundary组件中。
        // RepaintBoundary 读者可以先简单理解为它是一个”绘制边界“，
        // 将列表项包裹在RepaintBoundary中可以避免列表项不必要的重绘，
        // 但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，
        // 不添加RepaintBoundary反而会更高效,
        // 如果列表项自身来维护是否需要添加绘制边界组件，则此参数应该指定为 false。
        addRepaintBoundaries: true,
        children: [Text("12313212")],
      ),
      "ListView.Simple");

  Widget simpleListViewBuilder() => SampleStateFulWidget(
      ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Text("position-----" + index.toString());
          },
          itemCount: 100,
          itemExtent: 100),
      "ListView.Builder");

  /// 用于在生成的列表之间添加一个分割组件 */
  Widget simpleSeparated() => SampleStateFulWidget(
      ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Text("position-----" + index.toString());
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.blue,
              height: 20,
            );
          },
          itemCount: 100),
      "ListView.Builder");
}
