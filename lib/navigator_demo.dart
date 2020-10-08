import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Animate-app",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        routes: <String, WidgetBuilder>{
          '/one': (BuildContext context) => OnePage(),
          '/two': (BuildContext context) => TwoPage()
        },
        home: OnePage(),
      );
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("One Page")),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/two');
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
