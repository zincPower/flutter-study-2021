import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

// 需要继承 TickerProvider ，如果有多个 AnimationController，则应该使用 TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  initState() {
    super.initState();
    AnimationController _controller = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addListener(() {
        setState(() => {});
      });
    controller = _controller;

    // 曲线
    final _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    // 区间
    animation = new Tween(
      begin: 0.0,
      end: 300.0,
    ).animate(_animation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: Image.asset(
                  "assets/images/icon_image_test.png",
                  width: animation?.value,
                  height: animation?.value,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // 启动动画(正向执行)
                controller?.forward();
              },
              child: Text('Start forward'),
            ),
            TextButton(
              onPressed: () {
                // 启动动画(逆向执行)
                controller?.reverse();
              },
              child: Text('Start reverse'),
            ),
            TextButton(
              onPressed: () {
                controller?.stop(canceled: true);
              },
              child: Text('Stop'),
            ),
            TextButton(
              onPressed: () {
                controller?.repeat();
              },
              child: Text('Repeat'),
            ),
            TextButton(
              onPressed: () {
                controller?.reset();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放
    controller?.dispose();
    super.dispose();
  }
}
