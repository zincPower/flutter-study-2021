import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatefulWidget {
  const DecoratedBoxWidget({Key? key}) : super(key: key);

  @override
  _DecoratedBoxWidgetState createState() => _DecoratedBoxWidgetState();
}

class _DecoratedBoxWidgetState extends State<DecoratedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.orange.shade700,
          ],
        ), //背景渐变
        borderRadius: BorderRadius.circular(3.0), //3像素圆角
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
