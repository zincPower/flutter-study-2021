import 'package:flutter/material.dart';

class AnimatedDecoratedBox extends StatefulWidget {
  AnimatedDecoratedBox({
    Key? key,
    required this.duration,
    required this.reverseDuration,
    required this.decoration,
    required this.child,
    this.curve = Curves.linear,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBoxState createState() => _AnimatedDecoratedBoxState();
}

class _AnimatedDecoratedBoxState extends State<AnimatedDecoratedBox>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  DecorationTween? _tween;

  @override
  void initState() {
    super.initState();
    // 初始化动画
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
  void didUpdateWidget(AnimatedDecoratedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    final controller = _controller;
    if (widget.curve != oldWidget.curve && controller != null) {
      _animation = CurvedAnimation(parent: controller, curve: widget.curve);
    }
    _controller?.duration = widget.duration;
    _controller?.reverseDuration = widget.reverseDuration;
    // 设置动画状态
    if (widget.decoration != (_tween?.end ?? _tween?.begin)) {
      // begin 用于估算当前的动画值
      _tween
        ?..begin = _tween?.evaluate(_animation!)
        ..end = widget.decoration;
      _controller
        ?..value = 0.0
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween!.animate(_animation!).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
