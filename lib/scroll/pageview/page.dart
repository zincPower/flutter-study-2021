// Tab 页面
import 'package:flutter/material.dart';

class PageWidget extends StatefulWidget {
  const PageWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(
      child: Text("${widget.text}", textScaleFactor: 5),
    );
  }
}
