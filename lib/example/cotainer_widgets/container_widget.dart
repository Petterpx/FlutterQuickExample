import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 10, left: 10),
        margin: EdgeInsets.only(top: 10, left: 100),
        constraints: BoxConstraints.tightFor(height: 100, width: 100),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.red, Colors.green],
                center: Alignment.topLeft,
                radius: .98),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        transform: Matrix4.rotationZ(.2),
        alignment: Alignment.center,
        child: Text(
          "卡片文字",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      );
}
