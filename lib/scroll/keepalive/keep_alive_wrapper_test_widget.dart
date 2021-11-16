import 'package:flutter/material.dart';
import 'package:flutter_study_2021/scroll/keepalive/keep_alive_wrapper.dart';

class KeepAliveWrapperTestWidget extends StatelessWidget {
  const KeepAliveWrapperTestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (_, index) {
        return KeepAliveWrapper(
          // 为 true 后会缓存所有的列表项，列表项将不会销毁。
          // 为 false 时，列表项滑出预加载区域后将会别销毁。
          // 使用时一定要注意是否必要，因为对所有列表项都缓存的会导致更多的内存消耗
          keepAlive: false,
          child: ListItem(index: index),
        );
      }),
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text('${widget.index}'));
  }

  @override
  void dispose() {
    print('dispose ${widget.index}');
    super.dispose();
  }
}
