import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidgetPage extends StatefulWidget {
  const TextfieldWidgetPage({Key? key}) : super(key: key);

  @override
  _TextfieldWidgetPageState createState() => _TextfieldWidgetPageState();
}

class _TextfieldWidgetPageState extends State<TextfieldWidgetPage> {
  TextEditingController? controller;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    String content = '"zinc power"——江澎涌\n"zinc power"\n"zinc power"——jiang';
    controller = TextEditingController()
      ..text = content
      ..addListener(() {})
      ..selection = TextSelection(
        baseOffset: 0,
        extentOffset: content.length,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextField(
          // 文本控制
          controller: controller,
          // 对焦控制
          focusNode: focusNode,
          // text field 外观显示
          decoration: getDecoration(),
          // 键盘输入类型
          // keyboardType: TextInputType.phone,
          // 键盘完成按钮动作
          // textInputAction: TextInputAction.search,
          // this.textCapitalization = TextCapitalization.none,
          // 编辑文本样式
          style: TextStyle(
            color: Colors.orange,
          ),
          // strutStyle:,
          // 输入框内编辑文本水平方向对齐方式
          // textAlign: TextAlign.center,
          // 输入框内编辑文本垂直方向对齐方式[不知道什么作用]
          // textAlignVertical: TextAlignVertical.bottom,
          // this.textDirection,
          // 是否只读，和 enable 的区别在于还可以长按选择
          // readOnly: true,
          // 长按、右键显示的控制板
          toolbarOptions: ToolbarOptions(
            copy: false, // 复制
            cut: true, // 剪切
            paste: false, // 粘贴
            selectAll: true, // 全选
          ),
          // 是否显示光标
          // showCursor: false,
          // 自动对焦
          autofocus: true,
          // 隐藏文本使用的占位符
          // obscuringCharacter: '*',
          // 是否隐藏文本
          // obscureText: true,
          // 自动校正[不知道什么作用]
          // autocorrect: false,
          // 智能替换 破折号[貌似是 ios]
          smartDashesType: SmartDashesType.disabled,
          // https://developer.apple.com/documentation/uikit/uitextsmartquotestype/yes
          // 智能替换 双引号[貌似是 ios]
          smartQuotesType: SmartQuotesType.enabled,
          // 启动建议[不知道什么作用]
          enableSuggestions: true,
          // 至多多少行
          maxLines: 10,
          // 至少多少行
          minLines: 3,
          // 将 textfield 扩大到最大，但需要将 maxLines 和 minLines 同时设置为 null
          // expands: true,
          // 限制字符长度
          // maxLength: 10,
          // @Deprecated(
          //   'Use maxLengthEnforcement parameter which provides more specific '
          //   'behavior related to the maxLength limit. '
          //   'This feature was deprecated after v1.25.0-5.0.pre.'
          // )
          // this.maxLengthEnforced = true,
          // MaxLengthEnforcement.none // 可以输入超过限定长度，但会爆红
          // MaxLengthEnforcement.enforced  // 不可以输入超过限定长度，会截断，但如果通过 _controller 设置的值是可以通过
          // MaxLengthEnforcement.truncateAfterCompositionEnds // 处理结果和 enforced 相同，只是在输入过程不会阻断，但是输入完还是截断
          // https://flutter.cn/docs/release/breaking-changes/use-maxLengthEnforcement-instead-of-maxLengthEnforced
          // 代替 maxLengthEnforced
          maxLengthEnforcement:
              MaxLengthEnforcement.truncateAfterCompositionEnds,
          // 回调值变动
          onChanged: (value) {
            print('change value: $value');
          },
          // 点击了键盘的 “完成” 或 “搜索” 回调，和 onSubmitted 的区别在于没有回到值
          // onEditingComplete: () {
          //   print('onEditingComplete');
          // },
          // 点击了键盘的 “完成” 或 “搜索” 回调，和 onEditingComplete 的区别在于有回到值
          // onSubmitted: (value) {
          //   print('submit value: $value');
          // },
          // [不知道作用]
          // onAppPrivateCommand: (key, value) {
          //   print('key: $key');
          // },
          // 用于限制输入的内容，接收一个 TextInputFormatter 类型的集合。
          // inputFormatters: [FilteringTextInputFormatter.deny(RegExp("[a-z]"))],
          // 是否可以编辑，和 readonly 区别在于，enable 完全不能控制，readonly 还能长按
          // enabled: false,
          // 光标宽度
          cursorWidth: 5.0,
          // 光标高度，在没有文字输入的时候作用
          cursorHeight: 20,
          // 光标圆角
          cursorRadius: Radius.circular(5.0),
          // 光标颜色
          cursorColor: Colors.orangeAccent,
          // 长按选择区域的高样式
          selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
          // 长按选择区域的宽样式
          selectionWidthStyle: BoxWidthStyle.tight,
          // 键盘样式[只有 ios 有效]
          keyboardAppearance: Brightness.dark,
          // [不知道作用]
          scrollPadding: const EdgeInsets.all(20.0),
          // 开始拖动的计算偏移量
          dragStartBehavior: DragStartBehavior.start,
          // 是否可以长按选择
          enableInteractiveSelection: false,
          // 选择控制
          // selectionControls: ,
          // 点击事件
          onTap: () {
            print('on tap');
          },
          // mouseCursor:,
          // buildCounter: ,
          // 滚动监听
          // scrollController:,
          // this.scrollPhysics,
          // this.autofillHints,
          // this.restorationId,
        ),
      ),
    );
  }

  InputDecoration getDecoration() {
    return InputDecoration(
      icon: Icon(Icons.person),
      labelText: 'Label Text',
      labelStyle: TextStyle(
        color: Colors.red,
      ),
      helperText: 'Helper Text',
      // this.helperStyle,
      // this.helperMaxLines,
      // this.hintText,
      // this.hintStyle,
      // this.hintTextDirection,
      // this.hintMaxLines,
      // this.errorText,
      // this.errorStyle,
      // this.errorMaxLines,
      // @Deprecated(
      //   'Use floatingLabelBehavior instead. '
      //   'This feature was deprecated after v1.13.2.'
      // )
      // this.hasFloatingPlaceholder = true,
      // this.floatingLabelBehavior,
      // this.isCollapsed = false,
      // this.isDense,
      // this.contentPadding,
      // this.prefixIcon,
      // this.prefixIconConstraints,
      // this.prefix,
      // this.prefixText,
      // this.prefixStyle,
      // this.suffixIcon,
      // this.suffix,
      // this.suffixText,
      // this.suffixStyle,
      // this.suffixIconConstraints,
      // this.counter,
      // this.counterText,
      // this.counterStyle,
      // this.filled,
      // this.fillColor,
      // this.focusColor,
      // this.hoverColor,
      // this.errorBorder,
      // this.focusedBorder,
      // this.focusedErrorBorder,
      // this.disabledBorder,
      // this.enabledBorder,
      // this.border,
      // this.enabled = true,
      // this.semanticCounterText,
      // this.alignLabelWithHint,
    );
  }
}

// class MyTextSelectionControls extends TextSelectionControls{
//   @override
//   Widget buildHandle(BuildContext context, TextSelectionHandleType type, double textLineHeight) {
//     // TODO: implement buildHandle
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildToolbar(BuildContext context, Rect globalEditableRegion, double textLineHeight, Offset position, List<TextSelectionPoint> endpoints, TextSelectionDelegate delegate, ClipboardStatusNotifier clipboardStatus, Offset? lastSecondaryTapDownPosition) {
//     // TODO: implement buildToolbar
//     throw UnimplementedError();
//   }

//   @override
//   Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight) {
//     // TODO: implement getHandleAnchor
//     throw UnimplementedError();
//   }

//   @override
//   Size getHandleSize(double textLineHeight) {
//     // TODO: implement getHandleSize
//     throw UnimplementedError();
//   }

// }