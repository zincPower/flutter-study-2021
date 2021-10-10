import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_2021/layout/align_widget.dart';
import 'package:flutter_study_2021/layout/center_widget.dart';
import 'package:flutter_study_2021/layout/column_widget.dart';
import 'package:flutter_study_2021/layout/flex_widget.dart';
import 'package:flutter_study_2021/layout/flow_widget.dart';
import 'package:flutter_study_2021/layout/nested_layout_widget.dart';
import 'package:flutter_study_2021/layout/responsive_column.dart';
import 'package:flutter_study_2021/layout/row_widget.dart';
import 'package:flutter_study_2021/layout/stack_widget.dart';
import 'package:flutter_study_2021/layout/wrap_widget.dart';

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
                  return RowWidget();
                }));
              },
              child: Text('Row'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ColumnWidget();
                }));
              },
              child: Text('Column'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NestedLayoutWidget();
                }));
              },
              child: Text('Nested Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlexLayoutWidget();
                }));
              },
              child: Text('Flex Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WrapWidget();
                }));
              },
              child: Text('Wrap Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FlowWidget();
                }));
              },
              child: Text('Flow Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StackWidget();
                }));
              },
              child: Text('Stack Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AlignWidget();
                }));
              },
              child: Text('Align Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CenterWidget();
                }));
              },
              child: Text('Center Layout'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LayoutBuilderRoute();
                }));
              },
              child: Text('responsive Layout'),
            ),
          ],
        ),
      ),
    );
  }
}
