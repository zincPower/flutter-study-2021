import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  // 通过扣接 TabBar 和 TabBarView 达到联动
  TabController? _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this)
      ..addListener(() {
        // switch (_tabController?.index ?? 0) {
        // case 1:
        //   break;
        // case 2:
        //   break;
        // }
        setState(() {
          _selectedIndex = _tabController?.index ?? 0;
        });
      });
  }

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
        // 导航栏右侧菜单
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
        ],
        // 导航栏最左侧 widget，常见为抽屉菜单按钮或返回按钮
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // 如果自行定义抽屉，则需要自定义打开
                // 通过 Scaffold.of(context) 获取最近的 Scaffold state 对象
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        // 分页
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map(
                // (content) => Tab(text: content),
                (content) => Tab(
                  height: 100,
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      drawer: MyDrawer(),
      // 抽屉
      // 底部导航
      // bottomNavigationBar: BottomNavigationBar(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      // 设置浮动按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 3,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController?.index = _selectedIndex;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // 移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/icon_image_test.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "江澎涌",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
