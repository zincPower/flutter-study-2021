import 'package:flutter/material.dart';

/// 命名路由

class NameRoute1 extends StatelessWidget {
  const NameRoute1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由 1'),
      ),
      body: Center(
        child: Text('命名路由 1'),
      ),
    );
  }
}

class NameRoute2 extends StatelessWidget {
  const NameRoute2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由 2'),
      ),
      body: Center(
        child: Text('命名路由 2'),
      ),
    );
  }
}

class NameRouteWithParam extends StatelessWidget {
  const NameRouteWithParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final param = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由携带参数'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('命名路由，参数：$param'),
            TextButton(
              onPressed: () {
                Navigator.pop(context, '江澎涌');
              },
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

// 构造函数指定入参
class NameRouteWithParamInConstructor extends StatelessWidget {
  final String param;
  const NameRouteWithParamInConstructor({
    required this.param,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由携带参数(构造函数)'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('命名路由，参数：$param'),
            TextButton(
              onPressed: () {
                Navigator.pop(context, '江澎涌');
              },
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}
