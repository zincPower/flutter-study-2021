import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_study_2021/utils/load_ui_image.dart';
import 'package:path_provider/path_provider.dart';

class ImageWidgetFitStylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("assets/images/icon_image_test.png");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Image>[
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              ),
            ].map((e) {
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(e.fit.toString())
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ImageWidgetLoadPage extends StatefulWidget {
  const ImageWidgetLoadPage({Key? key}) : super(key: key);

  @override
  _ImageWidgetLoadPageState createState() => _ImageWidgetLoadPageState();
}

class _ImageWidgetLoadPageState extends State<ImageWidgetLoadPage> {
  String localPath = '';
  Uint8List? assetImageByte;

  @override
  void initState() {
    super.initState();
    getImageLocalPath('icon_image_test.png');
    getAssetImage('assets/images/icon_image_test.png');
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Text('Asset'),
      Image.asset('assets/images/icon_image_test.png'),
      Text('Nework'),
      Image.network(
          'https://img0.baidu.com/it/u=1242053365,2901037121&fm=26&fmt=auto&gp=0.jpg'),
    ];
    if (localPath.isNotEmpty) {
      children.add(Text('File'));
      children.add(Image.file(File(localPath)));
    }
    if (assetImageByte != null) {
      children.add(Text('Memory'));
      children.add(Image.memory(assetImageByte!));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  getImageLocalPath(imageName) async {
    final directory = await getApplicationDocumentsDirectory();
    localPath = directory.path + '/images/' + imageName;
    setState(() {});
  }

  getAssetImage(imagePath) async {
    final assetImage = await loadImageFromAsset(imagePath);
    final byte = await assetImage.toByteData(format: ui.ImageByteFormat.png);
    assetImageByte = byte?.buffer.asUint8List();
    setState(() {});
  }
}
