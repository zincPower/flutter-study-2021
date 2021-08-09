import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class GrowTransitionPage extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<GrowTransitionPage>
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
        child: GrowTransition(
          child: Image.asset(
            "assets/images/icon_image_test.png",
          ),
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
