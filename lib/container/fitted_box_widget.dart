import 'package:flutter/material.dart';
import 'package:flutter_study_2021/layout/responsive_column.dart';

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              wContainer(BoxFit.none),
              Text('jiang peng yong'),
              wContainer(BoxFit.contain),
              Text('Flutter'),
              Center(
                child: Column(
                  children: [
                    Text("溢出 row"),
                    wRow(' 90000000000000000 '),
                    Text("适配 row"),
                    FittedBox(child: wRow(' 90000000000000000 ')),
                    Text("无溢出，正常平均 row"),
                    LayoutLogPrint(tag: 1, child: wRow(' 800 ')),
                    Text("无法正常适配 row"),
                    FittedBox(
                      child: LayoutLogPrint(tag: 2, child: wRow(' 800 ')),
                    ),
                    SingleLineFittedBox(
                      child: wRow(' 90000000000000000 '),
                    ),
                    SingleLineFittedBox(child: wRow(' 800 ')),
                  ]
                      .map((e) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: e,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // clipBehavior: Clip.hardEdge,
        alignment: Alignment.topLeft,
        // 子容器超过父容器大小
        child: Container(
          width: 60,
          height: 70,
          color: Colors.blue,
          child: Text('jiang peng yong'),
        ),
      ),
    );
  }

  // 直接使用Row
  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              maxWidth: double.infinity,
              minWidth: constraints.maxWidth,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
