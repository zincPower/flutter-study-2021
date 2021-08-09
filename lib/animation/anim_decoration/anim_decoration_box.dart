import 'package:flutter/material.dart';

class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key? key,
    required this.decoration,
    required this.child,
    this.curve = Curves.linear,
    required this.duration,
    required this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? _animation;

  DecorationTween? _tween;

  @override
  void initState() {
    super.initState();
    final controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _controller = controller;
    _tween = DecorationTween(begin: widget.decoration);
    _animation = CurvedAnimation(parent: controller, curve: widget.curve);
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    // final controller = _controller;

    // if (controller == null) {
    //   return;
    // }

    // if (widget.curve != oldWidget.curve) {
    //   _animation = CurvedAnimation(parent: controller, curve: widget.curve);
    // }

    // controller
    //   ..duration = widget.duration
    //   ..reverseDuration = widget.reverseDuration;

    // final tween = _tween;
    // if (tween != null && widget.decoration != (tween.end ?? tween.begin)) {
    //   print('111');
    //   _tween!
    //     ..begin = _tween!.evaluate(_animation!)
    //     ..end = widget.decoration;
    // }

    // print('222');

    // _controller?.value = 0.0;
    // _controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //   animation: _animation!,
    //   builder: (context, child) {
    //     return DecoratedBox(
    //       decoration: _tween!.animate(_animation!).value,
    //       child: child,
    //     );
    //   },
    //   child: widget.child,
    // );
    return DecoratedBox(
      decoration: widget.decoration,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
