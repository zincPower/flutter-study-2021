import 'package:flutter/material.dart';

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于 200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于 200 ，显示单列
          return Column(children: children, mainAxisSize: MainAxisSize.min);
        } else {
          // 大于 200 ，显示双列
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(Row(
                children: [children[i], children[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(children: _children, mainAxisSize: MainAxisSize.min);
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("A"),
    ));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 限制宽度为190，小于 200
            SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
            ResponsiveColumn(children: _children),
            LayoutLogPrint(child: Text("xx")) // 下面介绍
          ],
        ),
      ),
    );
  }
}

/// 打印父级约束
class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert 在编译 release 版本时会被去除
      assert(() {
        print('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}
