import 'package:flutter/material.dart';
import 'package:flutter_study_2021/animation/anim_page/anim_b_page.dart';
import 'package:flutter_study_2021/animation/anim_page/fade_route.dart';

class AnimAPage extends StatelessWidget {
  const AnimAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (
                      BuildContext context,
                      Animation animation,
                      Animation secondaryAnimation,
                    ) {
                      print('anim: ${animation.value},' +
                          ' sec: ${secondaryAnimation.value}');

                      return new FadeTransition(
                        opacity: animation as Animation<double>,
                        child: AnimBPage(),
                      );
                    },
                  ),
                );
              },
              child: Text('渐显转场'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, FadeRoute(builder: (context) {
                  return AnimBPage();
                }));
              },
              child: Text('转场 route page'),
            ),
          ],
        ),
      ),
    );
  }
}
