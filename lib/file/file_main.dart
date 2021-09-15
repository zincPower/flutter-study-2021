import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => FileOperationRoute(),
      },
    );
  }
}

class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key? key}) : super(key: key);

  @override
  _FileOperationRouteState createState() => new _FileOperationRouteState();
}

class _FileOperationRouteState extends State<FileOperationRoute> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // 从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  // 读取内容
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  // 更改内容
  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  // 获取保存文件路径
  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('文件操作')),
      body: new Center(
        child: new Text('点击了 $_counter 次'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
