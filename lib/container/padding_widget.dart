import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  const PaddingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // 上下左右各添加 16 像素补白
          padding: EdgeInsets.all(16.0),
          child: Column(
            // 显式指定对齐方式为左对齐，排除对齐干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.greenAccent,
                child: Padding(
                  // 左边添加 8 像素补白
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    color: Colors.green,
                    child: Text("Hello world"),
                  ),
                ),
              ),
              Container(
                color: Colors.blueAccent,
                child: Padding(
                  // 上下各添加 8 像素补白
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    color: Colors.blue,
                    child: Text("I am Jack"),
                  ),
                ),
              ),
              Container(
                color: Colors.redAccent,
                child: Padding(
                  // 分别指定四个方向的补白
                  padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                  child: Container(
                    color: Colors.red,
                    child: Text("Your friend"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
