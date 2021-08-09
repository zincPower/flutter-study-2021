import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Hero(
            // 唯一标记，前后两个路由页 Hero 的 tag 必须相同
            tag: "avatar",
            child: Image.asset(
              "assets/images/icon_image_test.png",
            ),
          ),
        ),
      ),
    );
  }
}
