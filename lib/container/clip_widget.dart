import 'package:flutter/material.dart';

class ClipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset(
      "assets/images/icon_image_test.png",
      width: 60.0,
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              avatar, // 不剪裁
              ClipOval(child: avatar), // 剪裁为圆形
              // 剪裁为圆角矩形
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, // 宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 将溢出部分剪裁
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, // 宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 将溢出部分剪裁，不设置 clipper ，效果和 ClipRect 一样
                  ClipPath(
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, // 宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: ClipRect(
                  clipper: MyClipper(), //使用自定义的clipper
                  child: avatar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 发生在绘制阶段
class MyClipper extends CustomClipper<Rect> {
  /// 返回裁剪区域
  @override
  Rect getClip(Size size) {
    print("size: $size");
    return Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  }

  /// 用于决定是否需要重新裁剪
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
