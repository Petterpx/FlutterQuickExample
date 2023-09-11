import 'package:cloud_flutter_app/utils/util_view.dart';
import 'package:flutter/material.dart';

/// 表单 */
// ignore: must_be_immutable
class FromWidget extends StatelessWidget {
  TextEditingController _t1 = TextEditingController();
  TextEditingController _t2 = TextEditingController();
  TextEditingController _t3 = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Form(
              key: _formKey,
              child: Column(children: [
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: _t1,
                      decoration: InputDecoration(
                          labelText: "登录1",
                          hintText: "请输入用户名,不为null",
                          icon: Icon(Icons.person)),
                      validator: (v) {
                        return v!.trim().length > 0 ? null : "不为null";
                      },
                    ),
                    Builder(
                        builder: (context) => ElevatedButton(
                            child: Text("登录1->控制"),
                            onPressed: () {
                              // TODO: 2020/12/20 方式1
                              // if ((_formKey.currentState as FormState).validate()) {
                              //   showToast("验证通过");
                              // }

                              // TODO: 2020/12/20 方式2
                              // Form.of()
                              // 返回Element树里最近的 FormState,通过给定的context

                              //为什么包装一层Builder控件之后,Form.of正常了？因为你直接传递的context是根context啊
                              // 如果将它传递给Form.of(),内部由父部件开始向上查找，因为传递的是根，肯定找不到啊，所以肯定null啊
                              if (Form.of(context).validate()) {
                                showToast("验证通过");
                              }
                            })),
                  ],
                )),
                TextFormField(
                  autofocus: true,
                  controller: _t2,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "请输入用户名,不为null",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v!.trim().length > 0 ? null : "不为null";
                  },
                ),
                TextFormField(
                  autofocus: true,
                  controller: _t3,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入密码,长度大于3",
                      icon: Icon(Icons.lock)),
                  validator: (v) {
                    return v!.trim().length > 3 ? null : "长度大于3";
                  },
                ),
                // TODO: 2020/12/20 Form.of 测试
                Builder(
                    builder: (context) => ElevatedButton(
                        child: Text("测试From.of(context)"),
                        onPressed: () {
                          // TODO: 2020/12/20 这里点击只会响应当前最近的context所匹配的 FormState
                          if (Form.of(context)!.validate()) {
                            showToast("验证通过");
                          }
                        })),
              ])),
        ],
      );
}

class TestBtnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ElevatedButton(
      child: Text("测试From.of(context)"),
      onPressed: () {
        if (Form.of(context)!.validate()) {
          showToast("验证通过");
        }
      });
}
