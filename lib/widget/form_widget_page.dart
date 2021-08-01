import 'package:flutter/material.dart';

/// 表单
class FormWidgetRoute extends StatefulWidget {
  @override
  _FormWidgetRouteState createState() => new _FormWidgetRouteState();
}

class _FormWidgetRouteState extends State<FormWidgetRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Form(
          key: _formKey, // 设置globalKey，用于后面获取 FormState
          // autovalidate: true, //开启自动校验[已废弃，使用 autovalidateMode 代替]
          // 自动校验
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v!.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  // 校验密码
                  validator: (v) {
                    return v!.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        child: Text("登录[global key]"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            return Theme.of(context).primaryColor;
                          }),
                          textStyle:
                              MaterialStateProperty.resolveWith((states) {
                            return TextStyle(
                              color: Theme.of(context).primaryColor,
                            );
                          }),
                          padding: MaterialStateProperty.resolveWith((states) {
                            return EdgeInsets.all(15.0);
                          }),
                        ),
                        onPressed: () {
                          // 在这里不能通过此方式获取FormState，context 不对
                          // print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            // 验证通过提交数据
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        return ElevatedButton(
                          child: Text("登录[Form of]"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              return Theme.of(context).primaryColor;
                            }),
                            textStyle:
                                MaterialStateProperty.resolveWith((states) {
                              return TextStyle(
                                color: Theme.of(context).primaryColor,
                              );
                            }),
                            padding:
                                MaterialStateProperty.resolveWith((states) {
                              return EdgeInsets.all(15.0);
                            }),
                          ),
                          onPressed: () {
                            if ((Form.of(context) as FormState).validate()) {
                              // 验证通过提交数据
                            }
                          },
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
