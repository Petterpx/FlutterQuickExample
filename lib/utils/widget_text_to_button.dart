import 'package:flutter/cupertino.dart';

/// 组合Button，即button增加title注释 */
// ignore: must_be_immutable
class ButtonToTitleWidget extends StatelessWidget {
  late String title;
  late Widget childWidget;

  ButtonToTitleWidget({required String title, required Widget widget}) {
    this.title = title;
    this.childWidget = widget;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          childWidget,
          SizedBox(
            height: 30,
          )
        ],
      );
}

// class ButtonToTitleWidget extends StatefulWidget {
//   String _title;
//   Widget _widget;
//
//   ButtonToTitleWidget(this._title, this._widget);
//
//   @override
//   _ButtonToTitleWidgetState createState() => _ButtonToTitleWidgetState();
// }
//
// class _ButtonToTitleWidgetState extends State<ButtonToTitleWidget> {
//   @override
//   Widget build(BuildContext context) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[Text(widget._title), widget._widget],
//       );
// }
