import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_2021/layout/row_widget.dart';
import 'package:flutter_study_2021/scroll/singlechildscrollview_widget.dart';

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
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SingleChildScrollViewWidget();
                }));
              },
              child: Text('SingleChildScrollView'),
            ),
            // Scrollable(viewportBuilder: )
          ],
        ),
      ),
    );
  }
}