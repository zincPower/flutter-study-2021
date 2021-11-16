import 'package:flutter/material.dart';

/// 包裹后的控件不会被销毁，会保存在缓存中
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);

  /// 是否需要缓存
  final bool keepAlive;
  /// 子组件
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

/// 进行混合 AutomaticKeepAliveClientMixin
class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    /// 必须调用 super.build(context) 这样才能触发到 AutomaticKeepAliveClientMixin
    /// 的内部发送通知信息
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
