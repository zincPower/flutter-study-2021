import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(height: 300),
          child: Stack(
            // 指定未定位或部分定位 widget 的对齐方式
            alignment: Alignment.center,
            // 确定alignment对齐的参考系
            textDirection: TextDirection.ltr,
            // 此参数用于确定没有定位的子组件如何去适应 Stack 的大小
            // StackFit.loose 表示使用子组件的大小
            // StackFit.expand 表示扩伸到 Stack 的大小。
            fit: StackFit.loose,
            // none：不进行裁剪
            // hardEdge：这是最快的剪辑，但保真度较低（不抗锯齿）
            // antiAlias：比 `hardEdge` 慢一点，但边缘平滑（抗锯齿，与 `antiAliasWithSaveLayer` 不同的是可能会出现边缘伪影）
            // antiAliasWithSaveLayer：比 `antiAlias` 慢很多，应该很少使用（不会出现边缘伪影）
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              ),
              Positioned(
                top: 280.0,
                left: 0,
                right: 0,
                height: 100,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
