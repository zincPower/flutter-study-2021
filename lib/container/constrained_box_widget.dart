import 'package:flutter/material.dart';

class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
                  ),
              child: Container(
                height: 5.0,
                child: redBox,
              ),
            ),
            Container(height: 10),
            SizedBox(width: 80.0, height: 80.0, child: redBox),
            Container(height: 10),
            Container(
              color: Colors.blue,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 60.0,
                    minHeight: 100.0,
                    maxHeight: 150.0,
                    maxWidth: 150.0
                  ),
                  // 父
                  child: UnconstrainedBox(
                    // “去除”父级限制
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 200.0,
                        minHeight: 20.0,
                      ), // 子
                      child: redBox,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
