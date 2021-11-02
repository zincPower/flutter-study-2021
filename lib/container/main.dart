import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_2021/container/constrained_box_widget.dart';
import 'package:flutter_study_2021/container/container_widget.dart';
import 'package:flutter_study_2021/container/decorated_box_widget.dart';
import 'package:flutter_study_2021/container/padding_widget.dart';
import 'package:flutter_study_2021/container/scaffold_with_bottom_app_bar_widget.dart';
import 'package:flutter_study_2021/container/scaffold_widget.dart';
import 'package:flutter_study_2021/container/transform_widget.dart';

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
      home: MyHomePage(title: 'Layout Demo Home Page'),
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
                  return PaddingWidget();
                }));
              },
              child: Text('Padding'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConstrainedBoxWidget();
                }));
              },
              child: Text('Constrained Box'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DecoratedBoxWidget();
                }));
              },
              child: Text('Decorated Box'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TransformWidget();
                }));
              },
              child: Text('Transform'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContainerWidget();
                }));
              },
              child: Text('Container'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScaffoldWidget();
                }));
              },
              child: Text('Scaffold'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScaffoldWithBottomAppBarWidget();
                }));
              },
              child: Text('Scaffold With BottomAppBar'),
            ),
          ],
        ),
      ),
    );
  }
}
