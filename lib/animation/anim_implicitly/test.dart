// import 'package:flutter/material.dart';
// import 'package:flutter_study_2021/animation/anim_decoration/anim_decoration_box.dart';

// class AnimatedWidgetsTest extends StatefulWidget {
//   @override
//   _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
// }

// class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
//   double _padding = 10;
//   var _align = Alignment.topRight;
//   double _height = 100;
//   double _left = 0;
//   Color _color = Colors.red;
//   TextStyle _style = TextStyle(color: Colors.black);
//   Color _decorationColor = Colors.blue;
//   double _opacity = 1;

//   @override
//   Widget build(BuildContext context) {
//     var duration = Duration(milliseconds: 400);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: AnimatedDecoratedBox1(
//             duration: duration,
//             reverseDuration: duration,
//             decoration: BoxDecoration(color: _decorationColor),
//             child: TextButton(
//               onPressed: () {
//                 setState(() {
//                   _decorationColor = _decorationColor == Colors.blue
//                       ? Colors.red
//                       : Colors.blue;
//                 });
//               },
//               child: Text(
//                 "AnimatedDecoratedBox",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class AnimatedDecoratedBox1 extends StatefulWidget {
// //   AnimatedDecoratedBox1({
// //     Key? key,
// //     required this.decoration,
// //     required this.child,
// //     this.curve = Curves.linear,
// //     required this.duration,
// //     required this.reverseDuration,
// //   });

// //   final BoxDecoration decoration;
// //   final Widget child;
// //   final Duration duration;
// //   final Curve curve;
// //   final Duration reverseDuration;

// //   @override
// //   _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
// // }

// // class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
// //     with SingleTickerProviderStateMixin {
// //   @protected
// //   AnimationController get controller => _controller!;
// //   AnimationController? _controller;

// //   /// The animation driving this widget's implicit animations.
// //   Animation<double> get animation => _animation!;
// //   Animation<double>? _animation;

// //   DecorationTween? _tween;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedBuilder(
// //       animation: _animation!,
// //       builder: (context, child) {
// //         return DecoratedBox(
// //           decoration: _tween!.animate(_animation!).value,
// //           child: child,
// //         );
// //       },
// //       child: widget.child,
// //     );
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       duration: widget.duration,
// //       reverseDuration: widget.reverseDuration,
// //       vsync: this,
// //     );
// //     _tween = DecorationTween(begin: widget.decoration);
// //     _updateCurve();
// //   }

// //   void _updateCurve() {
// //     if (widget.curve != null)
// //       _animation = CurvedAnimation(parent: _controller!, curve: widget.curve);
// //     else
// //       _animation = _controller;
// //   }

// //   @override
// //   void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (widget.curve != oldWidget.curve) _updateCurve();
// //     _controller!.duration = widget.duration;
// //     _controller!.reverseDuration = widget.reverseDuration;
// //     //正在执行过渡动画
// //     if (widget.decoration != (_tween!.end ?? _tween!.begin)) {
// //       _tween!
// //         ..begin = _tween!.evaluate(_animation!)
// //         ..end = widget.decoration;
// //       _controller!
// //         ..value = 0.0
// //         ..forward();
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _controller!.dispose();
// //     super.dispose();
// //   }
// // }


// // class AnimatedDecoratedBox1 extends StatefulWidget {
// //   AnimatedDecoratedBox1({
// //     Key? key,
// //     required this.decoration,
// //     required this.child,
// //     this.curve = Curves.linear,
// //     required this.duration,
// //     required this.reverseDuration,
// //   });

// //   final BoxDecoration decoration;
// //   final Widget child;
// //   final Duration duration;
// //   final Curve curve;
// //   final Duration reverseDuration;

// //   @override
// //   _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
// // }

// // class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
// //     with SingleTickerProviderStateMixin {
// //   @protected
// //   AnimationController get controller => _controller!;
// //   AnimationController? _controller;

// //   /// The animation driving this widget's implicit animations.
// //   Animation<double> get animation => _animation!;
// //   Animation<double>? _animation;

// //   DecorationTween? _tween;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedBuilder(
// //       animation: _animation!,
// //       builder: (context, child) {
// //         return DecoratedBox(
// //           decoration: _tween!.animate(_animation!).value,
// //           child: child,
// //         );
// //       },
// //       child: widget.child,
// //     );
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       duration: widget.duration,
// //       reverseDuration: widget.reverseDuration,
// //       vsync: this,
// //     );
// //     _tween = DecorationTween(begin: widget.decoration);
// //     _updateCurve();
// //   }

// //   void _updateCurve() {
// //     if (widget.curve != null)
// //       _animation = CurvedAnimation(parent: _controller!, curve: widget.curve);
// //     else
// //       _animation = _controller;
// //   }

// //   @override
// //   void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (widget.curve != oldWidget.curve) _updateCurve();
// //     _controller!.duration = widget.duration;
// //     _controller!.reverseDuration = widget.reverseDuration;
// //     //正在执行过渡动画
// //     if (widget.decoration != (_tween!.end ?? _tween!.begin)) {
// //       _tween!
// //         ..begin = _tween!.evaluate(_animation!)
// //         ..end = widget.decoration;
// //       _controller!
// //         ..value = 0.0
// //         ..forward();
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _controller!.dispose();
// //     super.dispose();
// //   }
// // }

// // class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
// //   AnimatedDecoratedBox({
// //     Key? key,
// //     required this.decoration,
// //     required this.child,
// //     Curve curve = Curves.linear,
// //     required Duration duration,
// //   }) : super(
// //           key: key,
// //           curve: curve,
// //           duration: duration,
// //         );
// //   final BoxDecoration decoration;
// //   final Widget child;

// //   @override
// //   _AnimatedDecoratedBoxState createState() {
// //     return _AnimatedDecoratedBoxState();
// //   }
// // }

// // class _AnimatedDecoratedBoxState
// //     extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
// //   DecorationTween? _decoration;

// //   @override
// //   Widget build(BuildContext context) {
// //     return DecoratedBox(
// //       decoration: _decoration!.evaluate(animation),
// //       child: widget.child,
// //     );
// //   }

// //   @override
// //   void forEachTween(visitor) {
// //     _decoration = visitor(
// //       _decoration,
// //       widget.decoration,
// //       (value) => DecorationTween(begin: value),
// //     ) as Tween<Decoration>;
// //   }
// // }
