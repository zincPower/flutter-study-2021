import 'package:flutter/material.dart';
import 'package:flutter_study_2021/scroll/pageview/page.dart';

/// PageView
class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(PageWidget(text: '$i'));
    }
    return Scaffold(
      body: PageView(
        // 每次滑动是否强制切换整个页面，如果为 false ，则会根据实际的滑动距离显示页面
        // pageSnapping: false,
        reverse: true, // 反向
        // 是否预加载左右各一页
        allowImplicitScrolling: true,
        // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
        children: children,
      ),
    );
  }
}
