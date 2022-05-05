import 'package:cloud_flutter_app/example/basis_widgets/title_widget.dart';
import 'package:cloud_flutter_app/utils/widget_image_to_right.dart';
import 'package:cloud_flutter_app/utils/widget_text_to_box.dart';
import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  ImageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              TitleWidget(
                title: "加载本地图片",
                widget: Image(
                  image: AssetImage("images/klj.jpeg"),
                  width: 100,
                ),
              ),
              TitleWidget(
                title: "加载网络图片",
                widget: Image(
                  image: NetworkImage(
                      "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3942751454,1089199356&fm=26&gp=0.jpg"),
                  width: 100,
                ),
              ),
              TextToBoxWidget(title: "ful示例"),
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
              TitleWidget(
                title: "color和 colorBlendMode",
                widget: Image.asset(
                  "images/klj.jpeg",
                  width: 100,
                  color: Colors.red,
                  colorBlendMode: BlendMode.difference,
                ),
              ),
              TitleWidget(
                title: "repeat",
                widget: Image.asset(
                  "images/klj.jpeg",
                  width: 100,
                  height: 100,
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              TitleWidget(
                  title: "Material Design-iconFont",
                  widget: Text(
                    "sentiment_satisfied_alt",
                    style: TextStyle(
                        fontFamily: "MaterialIcons",
                        fontSize: 40,
                        color: Colors.red),
                  )),
              TitleWidget(title: "使用自定义字体图标", widget: Icon(AliIcons.cat))
            ],
          ),
        ),
      );
}

class AliIcons {
  static const IconData cat =
      const IconData(0xef6a, fontFamily: "AliIcon", matchTextDirection: true);
}
