import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Assets Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? userData = '空';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  userData = await loadAsset("assets/json/text_user_data.json");
                  setState(() {});
                },
                child: Text('获取文本 json [DefaultAssetBundle]'),
              ),
              TextButton(
                onPressed: () async {
                  userData = await loadAssetByRootBundle(
                    "assets/json/text_user_data_root_bundle.json",
                  );
                  setState(() {});
                },
                child: Text('获取文本 json [rootBundle]'),
              ),
              Text('User data: $userData'),
              // DecoratedBox(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/background.jpg'),
              //     ),
              //   ),
              // ),
              // 如果不设置宽高，则会直接使用图片的像素宽高值。
              // 值得注意注意的是，Image 控件的 width 、 height 是 dp 单位
              // 而图片的像素宽高值是 px ，所以就是可能因为 dpi 的倍率而图片被放大。
              Image.asset(
                'assets/images/background.jpg',
                // width: 300,
                // height: 300,
              ),
              Image.asset(
                'assets/images/dpi_test_icon.jpg',
                height: 100,
                width: 100,
              ),
              Image.asset(
                'images/package_icon.jpg',
                package: 'flutter_study_2021',
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> loadAsset(path) async {
    Function catchError = (e) {
      setState(() {
        userData = 'error:$e';
      });
    };
    return await DefaultAssetBundle.of(context)
        .loadString(path)
        .catchError(catchError);
  }

  Future<String> loadAssetByRootBundle(path) async {
    Function catchError = (e) {
      setState(() {
        userData = 'error:$e';
      });
    };
    return await rootBundle.loadString(path).catchError(catchError);
  }
}
