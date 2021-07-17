import 'package:flutter/material.dart';

/// 路由数据传递
class PassValueRoute extends StatelessWidget {
  PassValueRoute({
    Key? key,
    required this.text, // 传递的参数，String 类型
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由数据传递"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(text),
            TextButton(
              onPressed: () => Navigator.pop(context, "江澎涌"),
              child: Text("返回：携带返回参数“江澎涌”"),
            )
          ],
        ),
      ),
    );
  }
}
