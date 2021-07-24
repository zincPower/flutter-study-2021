import 'package:flutter/material.dart';

/// 按钮
class ButtonWidgetPage extends StatelessWidget {
  const ButtonWidgetPage({Key? key}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Widget'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {},
            child: Text('Raised button'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('ELevated button'),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('Flat button'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Text button'),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text('Outline button'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Outlined button'),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.send),
            label: Text('send'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.send),
            label: Text('send'),
          ),
          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("details"),
            onPressed: () {},
          ),
          TextButton.icon(
            icon: Icon(Icons.info),
            label: Text("details"),
            onPressed: () {},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("add"),
            onPressed: () {},
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.add),
            label: Text("add"),
            onPressed: () {},
          ),
          Text('================================'),
          TextButton.icon(
            icon: Icon(Icons.add),
            style: ButtonStyle(
              // 背景色
              backgroundColor: MaterialStateProperty.resolveWith(getColor),
              // 文本样式
              textStyle: MaterialStateProperty.resolveWith((states) {
                return TextStyle(
                  fontSize: 50,
                );
              }),
              // 字体颜色
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                return Colors.white;
              }),
              // 水波纹颜色
              overlayColor: MaterialStateProperty.resolveWith((states) {
                return Colors.purpleAccent;
              }),
              // 阴影颜色
              shadowColor: MaterialStateProperty.resolveWith((states) {
                return Colors.orangeAccent;
              }),
              // 阴影范围
              elevation: MaterialStateProperty.resolveWith((states) {
                return 20.0;
              }),
              // 内边距
              padding: MaterialStateProperty.resolveWith((states) {
                return EdgeInsets.all(10.0);
              }),
              // minimumSize:,
              // side:,
              // 圆角
              shape: MaterialStateProperty.resolveWith((states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                );
              }),
              // mouseCursor:,
              // visualDensity:,
              // tapTargetSize:,
              // animationDuration: Duration(seconds: 50),
              // enableFeedback:,
              // 对其方式
              alignment: Alignment.bottomRight,
            ),
            onPressed: () {},
            label: Text('diy'),
          ),
        ],
      ),
    );
  }
}
