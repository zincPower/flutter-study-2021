import 'package:flutter/material.dart';

/// 简单跳转
class SimplePage extends StatelessWidget {
  const SimplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}
