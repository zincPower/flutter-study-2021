import 'package:flutter/material.dart';

/// 混合多个 column，只有外部的 column 是展开的
/// 为了解决这个问题，需要加上 Expanded
class NestedLayoutWidget extends StatelessWidget {
  const NestedLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max, // 有效，外层 Column 高度为整个屏幕
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Text(
                        'Row outer',
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text('Row inner'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // 加上 Expanded 是为了让 内部的 Column 撑开
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, // 无效，内层 Column 高度为实际高度
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
