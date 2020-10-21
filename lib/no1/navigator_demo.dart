import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("One Page")),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TwoPage();
        }));
      },
      child: Icon(Icons.arrow_right),
    ),
  );
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Two Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Text("This is Intent Test"),
        ),
      );
}
