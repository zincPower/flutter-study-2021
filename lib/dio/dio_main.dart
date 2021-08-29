import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(DioMainPage());
}

Dio dio = Dio();

class DioMainPage extends StatefulWidget {
  const DioMainPage({Key? key}) : super(key: key);

  @override
  _DioMainPageState createState() => _DioMainPageState();
}

class _DioMainPageState extends State<DioMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  // 多个请求
  multiRequest() async {
    final response = await Future.wait([dio.post("/info"), dio.get("/token")]);
  }
}
