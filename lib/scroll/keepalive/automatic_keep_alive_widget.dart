// Tab 页面
import 'package:flutter/material.dart';

class PageWithCacheWidget extends StatefulWidget {
  const PageWithCacheWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageWithCacheWidgetState createState() => _PageWithCacheWidgetState();
}

class _PageWithCacheWidgetState extends State<PageWithCacheWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // 使用了 AutomaticKeepAlive 必须要调用 super.build(context)
    super.build(context);
    print("build ${widget.text}");
    return Center(
      child: Text("${widget.text}", textScaleFactor: 5),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// PageView
class PageViewWithCacheWidget extends StatelessWidget {
  const PageViewWithCacheWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(PageWithCacheWidget(text: '$i'));
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
