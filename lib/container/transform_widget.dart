import 'package:flutter/material.dart';
import 'dart:math' as math;

/// 变换
class TransformWidget extends StatelessWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: MediaQuery.of(context).size.width),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Transform(
              alignment: Alignment.topRight, // 相对于坐标系原点的对齐方式
              transform: Matrix4.skewY(0.3), // 沿Y轴倾斜 0.3 弧度
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
          Container(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            // 默认原点为左上角，左移 20 像素，向上平移 5 像素
            child: Transform.translate(
              offset: Offset(-20.0, -5.0),
              child: Text("Hello world"),
            ),
          ),
          Container(height: 100),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              // 旋转 90 度
              angle: math.pi / 2,
              child: Text("Hello world"),
            ),
          ),
          Container(height: 100),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5, // 放大到 1.5 倍
              child: Text("Hello world"),
            ),
          ),
          Container(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child:
                      Transform.scale(scale: 1.5, child: Text("Hello world"))),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                // 将 Transform.rotate 换成 RotatedBox
                child: RotatedBox(
                  quarterTurns: 1, // 旋转 90 度 ( 1/4 圈 )
                  child: Text("Hello world"),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
