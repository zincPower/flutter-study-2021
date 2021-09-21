import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PlatformTextWidget extends StatelessWidget {
  PlatformTextWidget({this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        // 在 native 中的唯一标识符，需要与 native 侧的值相同
        viewType: "platform_text_view",
        // 在创建 AndroidView 的同时，可以传递参数
        creationParams: <String, dynamic>{"content": text},
        // 用来编码 creationParams 的形式，可选 [StandardMessageCodec], [JSONMessageCodec], [StringCodec], or [BinaryCodec]
        // 如果存在 creationParams ，则该值不能为 null
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: "platform_text_view",
        creationParams: <String, dynamic>{"text": text},
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return Text("不支持的平台");
    }
  }
}
