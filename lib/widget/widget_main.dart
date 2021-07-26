import 'package:flutter/material.dart';
import 'package:flutter_study_2021/widget/button_widget_page.dart';
import 'package:flutter_study_2021/widget/image_widget_page.dart';
import 'package:flutter_study_2021/widget/text_widget_page.dart';

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
      home: MyHomePage(title: 'Widget Demo Home Page'),
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
                    builder: (context) => TextWidgetPage(),
                  ),
                );
              },
              child: Text('Text'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DefaultTextStylePage(),
                  ),
                );
              },
              child: Text('Default Text Style'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextFamilyPage(),
                  ),
                );
              },
              child: Text('Text Family Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ButtonWidgetPage(),
                  ),
                );
              },
              child: Text('Button Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageWidgetFitStylePage(),
                  ),
                );
              },
              child: Text('Image Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageWidgetLoadPage(),
                  ),
                );
              },
              child: Text('Load Image Page'),
            ),
          ],
        ),
      ),
    );
  }
}
