import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  ImageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("加载本地图片"),
              Image(
                image: AssetImage("images/klj.jpeg"),
                width: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text("加载网络图片"),
              Image(
                image: NetworkImage(
                    "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3942751454,1089199356&fm=26&gp=0.jpg"),
                width: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text("ful示例",style: TextStyle(fontSize: 17),),
              ImageTitleWidget(
                fit: BoxFit.contain,
              ),
              ImageTitleWidget(
                fit: BoxFit.cover,
              ),
              ImageTitleWidget(
                height: 80.0,
                fit: BoxFit.fill,
              ),
              ImageTitleWidget(
                height: 70.0,
                fit: BoxFit.fitHeight,
              ),
              ImageTitleWidget(
                width: 80.0,
                fit: BoxFit.fitWidth,
              ),
              ImageTitleWidget(
                fit: BoxFit.none,
              ),
              ImageTitleWidget(
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
      );
}

/// 图片右边带提示的ImageWidget */
// ignore: must_be_immutable
class ImageTitleWidget extends StatelessWidget {
  late String localPath;
  late BoxFit _fit;
  late String title;
  double _width = 100.0;
  double _height = 100.0;

  ImageTitleWidget(
      {Key? key,
      required BoxFit fit,
      width=150.0,
      height=100.0,
      String localPath = "images/klj.jpeg"})
      : super(key: key) {
    this.localPath = localPath;
    this.title = fit.toString();
    this._fit = fit;
    this._width = width;
    this._height = height;
  }

  @override
  Widget build(BuildContext context) => Column(
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
                  border: Border.all(color: Colors.red,width: 1),
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
