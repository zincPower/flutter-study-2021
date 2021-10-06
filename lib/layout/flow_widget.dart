import 'dart:math';

import 'package:flutter/material.dart';

class FlowWidget extends StatelessWidget {
  const FlowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            Container(
              width: 80.0,
              height: 100.0,
              color: Colors.blue,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.greenAccent,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.grey,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = 0.0;
    var y = 0.0;

    var parentWidth = context.size.width;
    var parentHeight = context.size.height;

    var rowHeight = 0.0;

    print('paintChildren size: $parentWidth, $parentHeight');

    // 计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var itemWidth = context.getChildSize(i)?.width ?? 0.0;
      var itemPlaceWidth = itemWidth + margin.right + margin.left;
      var itemHeight = context.getChildSize(i)?.height ?? 0.0;
      var itemPlaceHeight = itemHeight + margin.top + margin.bottom;

      var curWidth = itemPlaceWidth + x;
      if (curWidth <= parentWidth) {
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            x + margin.left,
            y + margin.top,
            0.0,
          ),
        );
        x = curWidth;
        rowHeight = max(itemPlaceHeight, rowHeight);
      } else {
        height += rowHeight;
        width = max(width, x);

        x = 0.0;
        y = height;

        rowHeight = 0.0;

        // 绘制子 widget (有优化)
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            x + margin.left,
            y + margin.top,
            0.0,
          ),
        );
        x = itemPlaceWidth;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    print('getSize');
    return Size(double.infinity, 300.0);
    // return Size(width, height);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
