import 'package:flutter/services.dart';

const String NATIVE_IMAGE_CHANNEL_NAME = 'textview_flutter/textview';

class TextViewChannel {
  static TextViewChannel? _instance;
  MethodChannel? _channel;

  TextViewChannel._internal();

  factory TextViewChannel.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = TextViewChannel._internal();
    }
    return _instance;
  }

  init() {
    _channel = MethodChannel('textview_flutter/textview');
    _channel?.setMethodCallHandler((call) async {
      print('TextViewChannel: $call');
    });
  }

  changeContent(String content) {
    _channel?.invokeMethod('changeContent', content);
  }

  release() {
    _channel = null;
  }
}
