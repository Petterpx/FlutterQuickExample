import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFromWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Form(
          child: Column(children: [
        TextFormField(
          decoration:
              InputDecoration(labelText: "用户名", hintText: "输入用户名，不为null"),
          validator: (v) => v!.trim().length > 0 ? null : "不能为null",
        ),
        Builder(
            builder: (context) => RaisedButton(
                child: Text("测试From.of(context)"),
                onPressed: () {
                  if (Form.of(context)!.validate()) {
                    showToast("验证通过");
                  }
                }))
      ]));
}
