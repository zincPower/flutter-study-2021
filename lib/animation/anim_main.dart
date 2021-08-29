import 'package:flutter/material.dart';
import 'package:flutter_study_2021/animation/anim_hero/anim_hero_page.dart';
import 'package:flutter_study_2021/animation/anim_implicitly/anim_decoration_main.dart';
import 'package:flutter_study_2021/animation/anim_page/page_route_builder_page.dart';
import 'package:flutter_study_2021/animation/anim_stagger/stagger_route.dart';
import 'package:flutter_study_2021/animation/anim_switcher/animated_switcher_main.dart';
import 'package:flutter_study_2021/animation/anim_widget/animated_builder_page.dart';
import 'package:flutter_study_2021/animation/anim_widget/animated_widget_page.dart';
import 'package:flutter_study_2021/animation/anim_widget/scale_anim_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScaleAnimationRoute();
                    },
                  ),
                );
              },
              child: Text('缩放动画'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScaleAnimationUseAnimatedWidgetPage();
                    },
                  ),
                );
              },
              child: Text('缩放动画(Animated Widget)'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScaleAnimationUseAnimatedBuilderPage();
                    },
                  ),
                );
              },
              child: Text('缩放动画(Animated Builder)'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScaleAnimationUseAnimatedBuilderPage();
                    },
                  ),
                );
              },
              child: Text('封装'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnimAPage();
                    },
                  ),
                );
              },
              child: Text('转场'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HeroAnimationRoute();
                    },
                  ),
                );
              },
              child: Text('Hero 动画'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return StaggerRoute();
                    },
                  ),
                );
              },
              child: Text('交织动画'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnimatedSwitcherCounterRoute();
                    },
                  ),
                );
              },
              child: Text('Swicther'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AnimDecorationMain();
                    },
                  ),
                );
              },
              child: Text('Decoration'),
            ),
          ],
        ),
      ),
    );
  }
}
