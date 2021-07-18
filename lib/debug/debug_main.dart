import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void main() {
  // 调试动画，减慢速度
  // timeDilation = 50;

  // 每当渲染盒被要求重新布局时，会将堆栈跟踪记录到控制台
  // debugPrintMarkNeedsLayoutStacks = true;
  // 每当渲染盒被要求重新绘制时，会将堆栈跟踪记录到控制台
  // debugPrintMarkNeedsPaintStacks = true;

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
      home: MyHomePage(title: 'Debug Demo Home Page'),
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
  int _counter = 0;

  // 布局调试
  bool _debugPaintSizeEnabled = false;
  // 文字基线调试
  bool _debugPaintBaselinesEnabled = false;
  // 点击调试
  bool _debugPaintPointersEnabled = false;
  // 层级调试
  bool _debugPaintLayerBordersEnabled = false;
  // 重绘调试
  bool _debugRepaintRainbowEnabled = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final center = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextButton(
            onPressed: () {
              // 控件树
              debugDumpApp();
            },
            child: new Text('Dump App'),
          ),
          TextButton(
            onPressed: () {
              // 渲染树
              debugDumpRenderTree();
            },
            child: new Text('Dump Render Tree'),
          ),
          TextButton(
            onPressed: () {
              // Layer 树
              debugDumpLayerTree();
            },
            child: new Text('Dump Layer Tree'),
          ),
          TextButton(
            onPressed: () {
              // 语义树
              // debugDumpSemanticsTree();
            },
            child: new Text('Dump Semantics Tree'),
          ),
          TextButton(
            onPressed: () {
              // 帧开始事件发生的位置
              debugPrintBeginFrameBanner = true;
            },
            child: new Text('begin frame banner'),
          ),
          TextButton(
            onPressed: () {
              // 帧结束事件发生的位置
              debugPrintEndFrameBanner = true;
            },
            child: new Text('end frame banner'),
          ),
          TextButton(
            onPressed: () {
              // 布局调试
              setState(() {
                _debugPaintSizeEnabled = !_debugPaintSizeEnabled;
                debugPaintSizeEnabled = _debugPaintSizeEnabled;
              });
            },
            child: new Text('paint size enable(now: $_debugPaintSizeEnabled)'),
          ),
          TextButton(
            onPressed: () {
              // 文字基线调试
              setState(() {
                _debugPaintBaselinesEnabled = !_debugPaintBaselinesEnabled;
                debugPaintBaselinesEnabled = _debugPaintBaselinesEnabled;
              });
            },
            child: new Text(
              'paint base line enable(now: $_debugPaintBaselinesEnabled)',
            ),
          ),
          TextButton(
            onPressed: () {
              // 点击调试
              setState(() {
                _debugPaintPointersEnabled = !_debugPaintPointersEnabled;
                debugPaintPointersEnabled = _debugPaintPointersEnabled;
              });
            },
            child: new Text(
                'paint pointers enable(now: $debugPaintPointersEnabled)'),
          ),
          TextButton(
            onPressed: () {
              // 每个层的边界
              setState(() {
                _debugPaintLayerBordersEnabled =
                    !_debugPaintLayerBordersEnabled;
                debugPaintLayerBordersEnabled = _debugPaintLayerBordersEnabled;
              });
            },
            child: new Text(
              'paint layer borders enable(now: $_debugPaintLayerBordersEnabled)',
            ),
          ),
          TextButton(
            onPressed: () {
              // 重绘
              setState(() {
                _debugRepaintRainbowEnabled = !_debugRepaintRainbowEnabled;
                debugRepaintRainbowEnabled = _debugRepaintRainbowEnabled;
              });
            },
            child: new Text(
                'paint layer borders enable(now: $_debugRepaintRainbowEnabled)'),
          ),
          TextButton(
            onPressed: () {
              debugPrintStack();
            },
            child: new Text('打印重新布局和绘制堆栈'),
          ),
          TextButton(
            onPressed: () {
              Timeline.startSync('interesting function');
              testDebug();
              Timeline.finishSync();
            },
            child: new Text('打印重新布局和绘制堆栈'),
          ),
        ],
      ),
    );

    printInfo(center);

    // 当 _counter 大于 10 的时候，就进入断点
    // debugger(when: _counter > 10);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: center,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  printInfo(Widget widget) {
    print('================== print ==================');
    print('StringShort: ${widget.toStringShort()}');
    print('StringDeep: ${widget.toStringDeep()}');
    print('String: ${widget.toString()}');

    debugPrint('================== debugPrint =================');
    debugPrint('StringShort: ${widget.toStringShort()}');
    debugPrint('StringDeep: ${widget.toStringDeep()}');
    debugPrint('String: ${widget.toString()}');
  }

  testDebug() {
    print('江澎涌');
  }
}
