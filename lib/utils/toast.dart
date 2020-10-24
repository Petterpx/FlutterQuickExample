import 'package:fluttertoast/fluttertoast.dart';

showToast(String message) => Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
    fontSize: 16.0);
