import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Material(
      child: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              // 动态创建一个 List<Widget>
              children: str
                  .split("")
                  // 每一个字母都用一个 Text 显示,字体为原来的两倍
                  .map((c) => Text(
                        c,
                        textScaleFactor: 2.0,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
