import 'package:flutter/material.dart';

/// 获取父级 state
class GetAncestorStatePage extends StatelessWidget {
  const GetAncestorStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取 State 对象"),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () {
                    // 查找父级最近的Scaffold对应的ScaffoldState对象
                    ScaffoldState? _state =
                        context.findAncestorStateOfType<ScaffoldState>();
                    //调用ScaffoldState的showSnackBar来弹出SnackBar
                    _state?.showSnackBar(
                      SnackBar(
                        content: Text("我是 SnackBar(findAncestorStateOfType)"),
                      ),
                    );
                  },
                  child: Text("显示 SnackBar(findAncestorStateOfType)"),
                );
              },
            ),
            Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () {
                    ScaffoldState _state = Scaffold.of(context);
                    _state.showSnackBar(
                      SnackBar(
                        content: Text("我是SnackBar(Scaffold.of)"),
                      ),
                    );
                  },
                  child: Text("显示 SnackBar(Scaffold.of)"),
                );
              },
            ),
            Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('A SnackBar has been shown.'),
                      ),
                    );
                  },
                  child: Text("显示 SnackBar(ScaffoldMessenger)"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
