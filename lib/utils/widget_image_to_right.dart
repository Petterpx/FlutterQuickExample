import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 图片右边带提示的ImageWidget */
// ignore: must_be_immutable
class ImageTitleWidget extends StatelessWidget {
  late String localPath;
  late BoxFit _fit;
  late String title;
  double _width = 100.0;
  double _height = 100.0;

  ImageTitleWidget({Key? key,
    required BoxFit fit,
    width = 150.0,
    height = 100.0,
    String localPath = "images/klj.jpeg"})
      : super(key: key) {
    this.localPath = localPath;
    this.title = fit.toString();
    this._fit = fit;
    this._width = width;
    this._height = height;
  }

  @override
  Widget build(BuildContext context) =>
      Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Center(
                  child: Image.asset(
                    localPath,
                    width: _width,
                    height: _height,
                    fit: _fit,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1),
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14),
              )
            ],
          )
        ],
      );
}
