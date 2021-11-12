import 'package:flutter/material.dart';
import 'package:flutter_study_2021/layout/responsive_column.dart';

/// ListView 的构造函数
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 分割线
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Container(
              color: Colors.green,
              child: ListView(
                shrinkWrap: false,
                reverse: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  const Text('I\'m dedicating every day to you'),
                  const Text('Domestic life was never quite my style'),
                  const Text('When you smile, you knock me out, I fall apart'),
                  const Text('And I thought I was so smart 1'),
                  const Text('And I thought I was so smart 2'),
                  const Text('And I thought I was so smart 3'),
                  const Text('And I thought I was so smart 4'),
                  const Text('And I thought I was so smart 5'),
                  const Text('And I thought I was so smart 6'),
                  const Text('And I thought I was so smart 7'),
                  const Text('And I thought I was so smart 8'),
                  const Text('And I thought I was so smart 9'),
                ],
              ),
            ),
          ),
          Container(
            height: 20,
            color: Colors.brown,
          ),
          SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue,
              child: ListView.builder(
                itemCount: null, // 子组件个数
                itemExtent: 50.0, // 强制高度为 50.0
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("$index"));
                },
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Container(
              color: Colors.redAccent,
              child: ListView.separated(
                itemCount: 100,
                // 列表项构造器
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("$index"));
                },
                // 分割器构造器
                separatorBuilder: (BuildContext context, int index) {
                  return index % 2 == 0 ? divider1 : divider2;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 固定列表项高度
/// 可以看到如果设置了 prototypeItem 或 itemExtent，则高度约束会限制在一个区域内
/// 如果没有设置，则高度约束变为 0.0 到 Infinity
class FixedExtentList extends StatelessWidget {
  const FixedExtentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        prototypeItem: ListTile(title: Text("1")),
        // itemExtent: 78,
        itemBuilder: (context, index) {
          return LayoutLogPrint(
            tag: index,
            child: ListTile(title: Text("$index")),
          );
        },
      ),
    );
  }
}

/// 加载更多
/// 利用了 ListView 在构建 item 时
/// 监测到特定的字母标记则认定为是需要走 "加载更多" 的流程
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        // 子项个数
        itemCount: _words.length,
        // 构建子项
        itemBuilder: (context, index) {
          // 如果到了表尾
          if (_words[index] == loadingTag) {
            // 不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          // 每次生成20个单词
          ['zinc', 'jpy', 'xpy', 'jiang peng yong'],
        );
      });
    });
  }
}

/// 固定头部
class FixHeaderListView extends StatelessWidget {
  const FixHeaderListView({Key? key}) : super(key: key);

  final bool isUseExpand = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表")),
          isUseExpand
              ? Expanded(
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text("$index"));
                  }),
                )
              : SizedBox(
                  // Material 设计规范中状态栏、导航栏、ListTile 高度分别为 24、56、56
                  // 这样处理的方式不够优雅，兼容性差
                  height: MediaQuery.of(context).size.height - 24 - 56 - 56,
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text("$index"));
                  }),
                ),
        ],
      ),
    );
  }
}
