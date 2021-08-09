import 'package:flutter/material.dart';

class ScaleAnimationUseAnimatedBuilderPage extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState
    extends State<ScaleAnimationUseAnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller!);
    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: animation!,
          child: Image.asset(
            "assets/images/icon_image_test.png",
          ),
          builder: (BuildContext ctx, Widget? child) {
            return new Center(
              child: Container(
                height: animation?.value,
                width: animation?.value,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }

  dispose() {
    controller?.dispose();
    super.dispose();
  }
}
