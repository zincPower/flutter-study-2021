import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return new Center(
      child: Image.asset(
        "assets/images/icon_image_test.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationUseAnimatedWidgetPage extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState
    extends State<ScaleAnimationUseAnimatedWidgetPage>
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
        child: AnimatedImage(
          animation: animation!,
        ),
      ),
    );
  }

  dispose() {
    controller?.dispose();
    super.dispose();
  }
}
