import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> globalKey = GlobalKey();

class GlobalKeyPage extends StatelessWidget {
  const GlobalKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Global Key"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            globalKey.currentState?.showBottomSheet((context) => Text('江澎涌'));
          },
          child: Text('Global key'),
        ),
      ),
    );
  }
}
