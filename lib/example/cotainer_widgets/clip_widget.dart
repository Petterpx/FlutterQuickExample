import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 裁剪类组件
/// https://book.flutterchina.club/chapter5/clip.html#_5-5-1-%E5%89%AA%E8%A3%81%E7%B1%BB%E7%BB%84%E4%BB%B6
/// */
class ClipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ClipOval(child: TitleImageWidget("裁剪为圆形")),
          //裁剪为圆角矩形
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: TitleImageWidget("裁剪为圆角矩形"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                // 宽度设为原来的一半，另一半会溢出
                widthFactor: .5,
                child: TitleImageWidget("宽度设为原来的一半，另一半会溢出"),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("裁剪溢出的另一半"),
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  // 裁剪溢出的另一半
                  widthFactor: .5,
                  child: Image.asset("images/icon.jpeg", width: 100),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "自定义裁剪 CustomClipper",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("只裁取指定区域"),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: ClipRect(
                  clipper: MyClipper(),
                  child: Image.asset("images/icon.jpeg", width: 100),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget TitleImageWidget(String data) => Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [Text(data), Image.asset("images/icon.jpeg", width: 100)],
      ));
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 15, 40, 30);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
