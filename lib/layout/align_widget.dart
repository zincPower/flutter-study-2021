import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blueAccent,
              child: Align(
                // alignment 为 AlignmentGeometry 类型
                // 必须是 Alignment、FractionalOffset 类型的值
                // alignment: FractionalOffset.topCenter,
                // alignment: FractionalOffset(1, 2),
                // alignment: Alignment.topRight,
                alignment: Alignment(0, 0.4),
                // 宽度和高度的缩放因子，会将子控件的尺寸乘以该缩放因子，得到 Align 的尺寸
                // 如果设置为 null，则会撑满 Align 的父控件空间，相当于 Android 的 match_parent
                // widthFactor: null,
                // widthFactor: 3,
                // heightFactor: 3,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Color.fromARGB(125, 255, 0, 0),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Align(
                // alignment 为 AlignmentGeometry 类型
                // 必须是 Alignment、FractionalOffset 类型的值
                // alignment: FractionalOffset.topCenter,
                // alignment: FractionalOffset(1, 2),
                // alignment: Alignment.topRight,
                alignment: Alignment(0, 1),
                // 宽度和高度的缩放因子，会将子控件的尺寸乘以该缩放因子，得到 Align 的尺寸
                // 如果设置为 null，则会撑满 Align 的父控件空间，相当于 Android 的 match_parent
                // widthFactor: null,
                // widthFactor: 3,
                // heightFactor: 3,
                child: Container(
                  width: 80,
                  height: 36,
                  color: Color.fromARGB(125, 0, 255, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
