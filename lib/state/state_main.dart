import 'package:flutter/material.dart';
import 'package:flutter_study_2021/state/ancestor_state_page.dart';
import 'package:flutter_study_2021/state/global_key_page.dart';
import 'package:flutter_study_2021/state/state_manage_page.dart';
import 'package:flutter_study_2021/state/state_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'State Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContextRoute(),
                  ),
                );
              },
              child: Text('通过 context 获取父级组件'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatePage(),
                  ),
                );
              },
              child: Text('state 生命周期'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetAncestorStatePage(),
                  ),
                );
              },
              child: Text('获取父级 state'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GlobalKeyPage(),
                  ),
                );
              },
              child: Text('global key'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TapboxA(),
                  ),
                );
              },
              child: Text('自己管理状态'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParentWidget(),
                  ),
                );
              },
              child: Text('父管理状态'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParentWidgetC(),
                  ),
                );
              },
              child: Text('混合管理'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context 测试——江澎涌"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Builder(builder: (context) {
            // // 在 Widget 树中向上查找最近的父级 `Scaffold` widget
            // Scaffold? scaffold =
            //     context.findAncestorWidgetOfExactType<Scaffold>();
            // // 直接返回 AppBar 的 title， 此处实际上是 Text("Context 测试——江澎涌")
            // return (scaffold?.appBar as AppBar).title ?? Text('Null');

            Container? container =
                context.findAncestorWidgetOfExactType<Container>();
            final color =
                (container?.decoration as BoxDecoration).color ?? null;
            return Text(
              color.toString(),
              style: TextStyle(
                backgroundColor: color,
              ),
            );
          }),
        ),
      ),
    );
  }
}
