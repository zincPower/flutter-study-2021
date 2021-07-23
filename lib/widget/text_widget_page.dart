import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_2021/widget/utils/font.dart';
import 'package:path_provider/path_provider.dart';

/// 文本样式
class TextWidgetPage extends StatelessWidget {
  final LongPressGestureRecognizer _recognizer = LongPressGestureRecognizer();

  TextWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _recognizer..onLongPress = _handlePress;
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('江澎涌(normal)'),
          Text(
            'Zinc Power(right)',
            textAlign: TextAlign.end,
          ),
          Text(
            'Hello world! 江澎涌 (center)' * 5,
            textAlign: TextAlign.center,
          ),
          Text(
            'jiang peng yong(textScaleFactor)',
            textScaleFactor: 1.5,
          ),
          Text(
            'jiang peng yong(TextDirection rtl)' * 2,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.start,
          ),
          Text(
            'jiang peng yong(TextDirection ltr)' * 2,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
          ),
          Text(
            'jiang peng yong(style)',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              height: 1.2,
              fontFamily: 'Courier',
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(text: 'Github:'),
              TextSpan(
                text: 'https://github.com/zincPower/',
                style: TextStyle(
                  color: Colors.blue,
                ),
                recognizer: _recognizer,
              ),
            ],
          )),
        ],
      ),
    );
  }

  void _handlePress() {
    print('zincPower');
  }
}

/// Text 样式继承
class DefaultTextStylePage extends StatelessWidget {
  const DefaultTextStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Default Text Style Widget'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
        ),
        child: Column(
          children: [
            Text('江澎涌（继承样式）'),
            Text(
              'zinc power（覆盖颜色）',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              '江澎涌（取消继承样式）',
              style: TextStyle(inherit: false),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFamilyPage extends StatefulWidget {
  const TextFamilyPage({Key? key}) : super(key: key);

  @override
  _TextFamilyPageState createState() => _TextFamilyPageState();
}

class _TextFamilyPageState extends State<TextFamilyPage> {
  final localFontFamily = 'ZCOOLKuaiLe';

  @override
  void initState() {
    super.initState();
    loadFont(localFontFamily, 'ZCOOLKuaiLe.ttf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Family'),
      ),
      body: Column(
        children: [
          Text(
            '江澎涌(asset 字体)',
            style: TextStyle(
              fontFamily: 'testFontFamily',
              fontSize: 50,
            ),
          ),
          Text(
            '江澎涌(package 字体)',
            style: TextStyle(
              fontFamily: 'pacakgeFontFamily',
              // 这里可有可无，因为 pacakgeFontFamily 的字体包虽然放在 lib 中，
              // 但声明是在 flutter_study_2021 本项目中，所以不需要 package
              // package: 'flutter_study_2021',
              fontSize: 50,
            ),
          ),
          Text(
            '江澎涌(加载本地字体)',
            style: TextStyle(
              fontFamily: localFontFamily,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }

  loadFont(String fontFamily, String fontName) async {
    final directory = await getApplicationDocumentsDirectory();
    final fontsFolderPath = directory.path + '/fonts/';
    final fontsFilePath = fontsFolderPath + fontName;
    print('fontsFolderPath: $fontsFolderPath, ');
    await loadFontFromFile(fontFamily, fontsFilePath);
    setState(() {});
  }
}
