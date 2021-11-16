import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_2021/layout/row_widget.dart';
import 'package:flutter_study_2021/scroll/animated_list_widget.dart';
import 'package:flutter_study_2021/scroll/grid_view_widget.dart';
import 'package:flutter_study_2021/scroll/list_view_widget.dart';
import 'package:flutter_study_2021/scroll/keepalive/keep_alive_wrapper_test_widget.dart';
import 'package:flutter_study_2021/scroll/pageview/page_view_widget.dart';
import 'package:flutter_study_2021/scroll/scroll_controller_widget.dart';
import 'package:flutter_study_2021/scroll/singlechildscrollview_widget.dart';

import 'keepalive/automatic_keep_alive_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scroll Demo Home Page'),
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
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SingleChildScrollViewWidget();
              }));
            },
            child: Text('SingleChildScrollView'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListViewWidget();
              }));
            },
            child: Text('ListView'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FixedExtentList();
              }));
            },
            child: Text('ListView - 固定 item 高度'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InfiniteListView();
              }));
            },
            child: Text('ListView - LoadMore'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FixHeaderListView();
              }));
            },
            child: Text('ListView - 固定头部'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GridViewFixedCrossAxisCountWidget();
              }));
            },
            child: Text('GridView SliverGridDelegateWithFixedCrossAxisCount'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GridViewWithCountWidget();
              }));
            },
            child: Text('GridView.count'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GridViewMaxCrossAxisExtentWidget();
              }));
            },
            child: Text('GridView SliverGridDelegateWithMaxCrossAxisExtent'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GridViewWithExtentWidget();
              }));
            },
            child: Text('GridView.extent'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GridViewWithBuilderWidget();
              }));
            },
            child: Text('GridView.builder'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScrollControllerWidget();
              }));
            },
            child: Text('ScrollController 滚动监听'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScrollNotificationWidget();
              }));
            },
            child: Text('ScrollNotification 监听'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AnimatedListWidget();
              }));
            },
            child: Text('AnimatedList'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageViewWidget();
              }));
            },
            child: Text('PageView'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageViewWithCacheWidget();
              }));
            },
            child: Text('Automatic Keep Alive'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return KeepAliveWrapperTestWidget();
              }));
            },
            child: Text('Keep Alive Wrapper Test'),
          ),
        ],
      ),
    );
  }
}
