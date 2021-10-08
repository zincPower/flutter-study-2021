import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text("xxx"),
              ),
            ),
            SizedBox(height: 10),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text("xxx"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
