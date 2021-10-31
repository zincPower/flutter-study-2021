import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Container(
          margin: EdgeInsets.only(
            top: 50.0,
            left: 120.0,
            right: 50,
            bottom: 100,
          ),
          // padding: EdgeInsets.all(20),
          // 卡片大小
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          // width: 260,
          // height: 200,
          // 背景装饰
          decoration: BoxDecoration(
            // 背景径向渐变
            gradient: RadialGradient(
              colors: [Colors.red, Colors.orange, Colors.green],
              center: Alignment.topLeft,
              radius: .98,
            ),
            // 卡片阴影
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              )
            ],
          ),
          // 卡片倾斜变换
          transform: Matrix4.rotationZ(.2),
          // 卡片内文字居中
          alignment: Alignment.center,
          child: Text(
            // 卡片文字
            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
