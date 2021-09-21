import 'package:flutter/material.dart';
import 'package:textview_flutter/platform_channel.dart';
import 'package:textview_flutter/platform_text_widget.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  void initState() {
    super.initState();
    TextViewChannel.getInstance().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform TextView"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Flutter Text Top"),
            Expanded(child: PlatformTextWidget(text: "江澎涌")),
            TextButton(
              onPressed: () {
                TextViewChannel.getInstance().changeContent('zinc');
              },
              child: Text('change'),
            ),
            Text("Flutter Text Bottom"),
          ],
        ),
      ),
    );
  }
}
