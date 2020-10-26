import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: 2020/10/26 一个普通的计数器
class MyCounterHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyCounterHomePage> {
  var sum = 0;

  _updateSum() {
    setState(() {
      ++sum;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("计数器示例")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("这是一个计数器"),
              Text(
                '$sum',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _updateSum();
          },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      );
}
