import 'package:flutter/material.dart';

class ScaffoldWithBottomAppBarWidget extends StatefulWidget {
  const ScaffoldWithBottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _ScaffoldWithBottomAppBarWidgetState createState() =>
      _ScaffoldWithBottomAppBarWidgetState();
}

class _ScaffoldWithBottomAppBarWidgetState
    extends State<ScaffoldWithBottomAppBarWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        // 页面标题
        title: Text("App Name"),
        // 导航栏底部的阴影
        elevation: 30,
        // 阴影颜色
        shadowColor: Colors.blue,
        // 标题是否居中
        centerTitle: true,
        // 背景颜色
        backgroundColor: Colors.green,
        // 前景颜色
        foregroundColor: Colors.black,
      ),
      // 底部导航
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      // 设置浮动按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      body: Container(),
    );
  }

  void _onAdd() {}
}
