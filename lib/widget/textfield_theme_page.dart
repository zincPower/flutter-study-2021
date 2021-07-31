import 'package:flutter/material.dart';

class TextfieldThemePage extends StatelessWidget {
  const TextfieldThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            accentColor: Colors.black,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.black,
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.grey,
              ), //定义label字体样式
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ), //定义提示文本样式
            ),
          ),
          child: Column(
            children: <Widget>[
              TextField(),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
                obscureText: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
