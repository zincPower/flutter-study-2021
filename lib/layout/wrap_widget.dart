import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          // 主轴方向
          direction: Axis.horizontal,
          // 主轴方向的对其方式，一行没有占满的时候，居左居右
          alignment: WrapAlignment.start,
          //
          runAlignment: WrapAlignment.end,
          // 次轴单行对齐方式，当一行中的控件高度不一时会有作用
          crossAxisAlignment: WrapCrossAlignment.center,
          // 子控件排列方向，rtl 是从右往左，ltr 是从左往右
          textDirection: TextDirection.ltr,
          // 起始位置是从顶部往下（VerticalDirection.down）
          // 还是底部网上（VerticalDirection.up）
          verticalDirection: VerticalDirection.down,
          // 主轴方向的子 widget 的间距
          spacing: 8.0,
          // 次轴方向间距
          runSpacing: 4.0,
          clipBehavior: Clip.none,
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('M'),
              ),
              label: SizedBox(
                height: 60,
                width: 100,
                child: Center(child: Text('Lafayette')),
              ),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('H'),
              ),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('J'),
              ),
              label: Text('Laurens'),
            ),
          ],
        ),
      ),
    );
  }
}
