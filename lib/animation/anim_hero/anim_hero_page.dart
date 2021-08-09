import 'package:flutter/material.dart';
import 'package:flutter_study_2021/animation/anim_hero/anim_hero_b_page.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              // 唯一标记，前后两个路由页 Hero 的 tag 必须相同
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "assets/images/icon_image_test.png",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              // 打开 B 路由
              Navigator.push(context, PageRouteBuilder(pageBuilder: (
                BuildContext context,
                Animation animation,
                Animation secondaryAnimation,
              ) {
                return new FadeTransition(
                  opacity: animation as Animation<double>,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              }));
            },
          ),
        ),
      ),
    );
  }
}
