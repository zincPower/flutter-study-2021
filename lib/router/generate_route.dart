import 'package:flutter/material.dart';

/// 命名路由拦截
class GenerateRoute extends StatelessWidget {
  final String? routeName;
  final Object? arguments;

  const GenerateRoute({
    required this.routeName,
    required this.arguments,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由拦截'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('name: $routeName'),
            Text('arguments: $arguments'),
            Text('route arguments: $routeArguments'),
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
