import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({Key? key}) : super(key: key);

  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < counter; i++) {
      data.add('${i + 1}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedList(
            key: globalKey,
            initialItemCount: data.length,
            itemBuilder: (
              BuildContext context,
              int index,
              Animation<double> animation,
            ) {
              // 添加列表项时会执行渐显动画
              return FadeTransition(
                opacity: animation,
                child: buildItem(context, index),
              );
            },
          ),
          buildAddBtn(),
        ],
      ),
    );
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add('${++counter}');
          // 告诉列表项有新添加的列表项
          var index = 0;
          if (data.length > 0) {
            index = data.length - 1;
          }
          globalKey.currentState?.insertItem(index);
          print('添加 $counter');
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

  // 构建列表项
  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      // 数字不会重复，所以作为 Key
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        // 点击时删除
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  void onDelete(context, index) {
    setState(() {
      globalKey.currentState?.removeItem(
        index,
        (context, animation) {
          // 删除过程执行的是反向动画，animation.value 会从 1 变为 0
          var item = buildItem(context, index);

          var removeData = data.removeAt(index);
          print('删除 $removeData');

          // 删除动画是一个合成动画：渐隐 + 缩小列表项告诉
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              // 让透明度变化的更快一些
              curve: const Interval(0.5, 1.0),
            ),
            // 不断缩小列表项的高度
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item,
            ),
          );
        },
        // 动画时间为 200 ms
        duration: Duration(milliseconds: 200),
      );
    });
  }
}
