import 'package:cloud_flutter_app/utils/util_view.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO: 2020/10/26 资源管理demo
class ResourceManager extends StatefulWidget {
  @override
  _ResourceManager createState() => _ResourceManager();
}

class _ResourceManager extends State {
  GlobalKey<ImageWidgetState> imageAssetKey = GlobalKey();
  GlobalKey<TextWidgetState> textAssetKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("资源管理")),
        body: Center(
          child: Column(
            children: <Widget>[
              WidgetFastButton("读取一个张图", () {
                imageAssetKey.currentState?.updateImage("images/icon.png");
              }),
              ImageWidget(imageAssetKey),
              WidgetFastButton("加载一段文本", () async {
                var textAsset = await rootBundle.loadString("data/test.json");
                textAssetKey.currentState?.updateTitle(textAsset);
              }),
              TextWidget(textAssetKey)
            ],
          ),
        ),
      );
}

class ImageWidget extends StatefulWidget {
  final Key key;

  ImageWidget(this.key);

  @override
  ImageWidgetState createState() => ImageWidgetState();
}

class ImageWidgetState extends State {
  String? image;

  updateImage(String image) {
    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) return Container(height: 0.0, width: 0.0);
    return Image(width: 200, height: 200, image: AssetImage(image!));
    // return Image.asset(image);
  }
}

class TextWidget extends StatefulWidget {
  final Key key;

  TextWidget(this.key);

  @override
  TextWidgetState createState() => TextWidgetState();
}

class TextWidgetState extends State {
  String? title;

  updateTitle(String title) {
    setState(() {
      this.title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) return Container(height: 0.0, width: 0.0);
    return Text(title!);
  }
}
