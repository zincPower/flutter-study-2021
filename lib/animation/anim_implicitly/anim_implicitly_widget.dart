import 'package:flutter/material.dart';

class AnimatedImplicitlyWidget extends ImplicitlyAnimatedWidget {
  AnimatedImplicitlyWidget({
    Key? key,
    required this.decoration,
    required this.child,
    Curve curve = Curves.linear, //动画曲线
    required Duration duration, // 正向动画执行时长
  }) : super(key: key, curve: curve, duration: duration);
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedImplicitlyWidget> {
  DecorationTween? _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration!.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(
      _decoration,
      widget.decoration,
      (value) => DecorationTween(begin: value),
    ) as DecorationTween;
  }
}
