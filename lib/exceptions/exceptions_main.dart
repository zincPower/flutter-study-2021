import 'dart:async';

import 'package:flutter/material.dart';

main(List<String> args) {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };

  // 自定义错误提示页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    return Scaffold(
      body: Center(
        child: Text("Custom Error Widget"),
      ),
    );
  };

  runZonedGuarded(
    () => runApp(MyApp()),
    (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, "Intercepted: $line");
        collectLog(line); // 收集日志
      },
    ),
  );
}

/// 收集日志
void collectLog(String line) {
  print("Intercepted: $line");
}

/// 上报错误和日志逻辑
void reportErrorAndLog(FlutterErrorDetails details) {
  print('reportErrorAndLog: $details');
}

/// 构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  return FlutterErrorDetails(exception: Exception('江澎涌 test'), stack: stack);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Exceptions Home Page'),
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
            Row(
              children: [
                Text('Row'),
                Container(
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                throw Exception('江澎涌');
              },
              child: Text('异常'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CustomErrorPage();
                    },
                  ),
                );
              },
              child: Text('自定义错误页面'),
            ),
            TextButton(
              onPressed: () async {
                throw Exception('江澎涌 async');
              },
              child: Text('async 异常'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomErrorPage extends StatelessWidget {
  const CustomErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> numList = ['1', '2'];
    print(numList[6]);
    return Container();
  }
}
