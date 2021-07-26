// 加载本地字体
import 'dart:io';

import 'package:flutter/services.dart';

Future loadFontFromFile(fontName, filePath) async {
  var fontLoader = FontLoader(fontName);
  fontLoader.addFont(fetchFontByteData(filePath));
  await fontLoader.load().catchError((e) {
    print(e);
  });
}

Future<ByteData> fetchFontByteData(filePath) async {
  ByteData byteData = (await File(filePath).readAsBytes()).buffer.asByteData();
  return byteData;
}
