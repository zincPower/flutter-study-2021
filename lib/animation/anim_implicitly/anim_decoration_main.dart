import 'package:flutter/material.dart';
import 'package:flutter_study_2021/animation/anim_implicitly/anim_decoration_box.dart';
import 'package:flutter_study_2021/animation/anim_implicitly/anim_implicitly_widget.dart';

class AnimDecorationMain extends StatefulWidget {
  const AnimDecorationMain({Key? key}) : super(key: key);

  @override
  _AnimDecorationMainState createState() => _AnimDecorationMainState();
}

class _AnimDecorationMainState extends State<AnimDecorationMain> {
  var value = 0;
  Color _decorationColor = Colors.blue;
  var duration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AnimatedDecoratedBox(
                duration: duration,
                reverseDuration: duration,
                decoration: BoxDecoration(color: _decorationColor),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ++value;
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox: $value",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              AnimatedImplicitlyWidget(
                decoration: BoxDecoration(color: _decorationColor),
                duration: duration,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ++value;
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedImplicitly: $value",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
