import 'package:flutter/material.dart';
import 'package:flutter_study_2021/animation/anim_decoration/anim_decoration_box.dart';

class AnimDecorationMain extends StatefulWidget {
  const AnimDecorationMain({Key? key}) : super(key: key);

  @override
  _AnimDecorationMainState createState() => _AnimDecorationMainState();
}

class _AnimDecorationMainState extends State<AnimDecorationMain> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    Color _decorationColor = Colors.blue;
    var duration = Duration(seconds: 1);

    var boxDecoration = BoxDecoration(color: _decorationColor);

    return Scaffold(
      body: Center(
        child: AnimatedDecoratedBox1(
          duration: duration,
          decoration: boxDecoration,
          reverseDuration: duration,
          child: TextButton(
            onPressed: () {
              setState(() {
                ++value;
                _decorationColor = Colors.red;
              });
            },
            child: Text(
              "AnimatedDecoratedBox: $value",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
