import 'package:flutter/material.dart';

/// ScrollController
class ScrollControllerWidget extends StatefulWidget {
  @override
  ScrollControllerWidgetState createState() {
    return ScrollControllerWidgetState();
  }
}

class ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false; // 是否显示 “返回到顶部” 按钮

  @override
  void initState() {
    super.initState();
    // 监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); // 打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // 为了避免内存泄露，需要调用 _controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
        child: ListView.builder(
            key: PageStorageKey(1),
            itemCount: 100,
            // 列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            itemExtent: 50.0,
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"));
            }),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                // 返回到顶部时执行动画
                _controller.animateTo(
                  .0,
                  // 动画时长
                  duration: Duration(milliseconds: 200),
                  // 动画曲线
                  curve: Curves.ease,
                );
                // _controller.jumpTo(100);
              }),
    );
  }
}

/// ScrollNotification 监听
class ScrollNotificationWidget extends StatefulWidget {
  @override
  _ScrollNotificationWidgetState createState() =>
      _ScrollNotificationWidgetState();
}

class _ScrollNotificationWidgetState extends State<ScrollNotificationWidget> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    // 进度条
    return Scaffold(
      body: Scrollbar(
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            // 重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");

            print('pixels: ${notification.metrics.pixels}');
            print('maxScrollExtent: ${notification.metrics.maxScrollExtent}');
            print('extentBefore: ${notification.metrics.extentBefore}');
            print('extentInside: ${notification.metrics.extentInside}');
            print('extentAfter: ${notification.metrics.extentAfter}');
            print('atEdge: ${notification.metrics.atEdge}');

            // return false;
            return true; // 放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) =>
                    ListTile(title: Text("$index")),
              ),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
