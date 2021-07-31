import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Textfield 焦点移动
class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  // 第一步：声明 FocusNode 和 FocusScopeNode
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      print('focusNode1: ${focusNode1.hasFocus}');
    });
    focusNode2.addListener(() {
      print('focusNode2: ${focusNode2.hasFocus}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, // 第二步：关联focusNode1
                decoration: InputDecoration(labelText: "input1"),
              ),
              TextField(
                focusNode: focusNode2, // 第二步：关联focusNode2
                decoration: InputDecoration(labelText: "input2"),
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      TextButton(
                        child: Text("移动焦点"),
                        onPressed: () {
                          // 第三步：切换焦点
                          if (null == focusScopeNode) {
                            focusScopeNode = FocusScope.of(context);
                          }
                          if (focusNode1.hasFocus) {
                            focusScopeNode?.requestFocus(focusNode2);
                          } else {
                            focusScopeNode?.requestFocus(focusNode1);
                          }
                        },
                      ),
                      TextButton(
                        child: Text("隐藏键盘"),
                        onPressed: () {
                          // 特殊：当所有编辑框都失去焦点时键盘就会收起
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
