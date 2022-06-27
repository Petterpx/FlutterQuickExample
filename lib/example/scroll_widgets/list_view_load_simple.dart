import 'dart:math';

import 'package:cloud_flutter_app/example/basis_widgets/progress_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/util_view.dart';

class ListLoadWidget extends StatefulWidget {
  const ListLoadWidget({Key? key}) : super(key: key);

  @override
  _ListLoadViewState createState() => _ListLoadViewState();
}

class ListLoadState {
  bool isEnd = false;
  var lists = List<String>.of({});
}

class _ListLoadViewState extends State<ListLoadWidget> {
  ListLoadState loadState = ListLoadState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SampleStateFulWidget(
        Column(
          children: [
            ListTile(
              title: Text("随机数字列表"),
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                if (index == loadState.lists.length - 1) {
                  _loadData();
                  return Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        //设置进度条的粗细
                        strokeWidth: 3,
                      ),
                    ),
                  );
                } else {
                  String message = index.toString() +
                      "----" +
                      loadState.lists[index].toString();
                  return Container(
                      child: Text(message,
                          style: TextStyle(fontSize: 30, color: Colors.grey)),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft);
                }
              },
              itemCount: loadState.lists.length,
              separatorBuilder: (context, index) => Divider(
                height: 0.5,
              ),
            ))
          ],
        ),
        "无限加载");
  }

  void _loadData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Random random = Random();
      var list = List<String>.of({});
      for (int i = 0; i < 20; i++) {
        list.add("----" + random.nextInt(10000).toString());
      }
      setState(() {
        var position = 0;
        if (loadState.lists.length != 0) {
          position = loadState.lists.length - 1;
        }
        loadState.lists.insertAll(position, list);
      });
    });
  }
}
