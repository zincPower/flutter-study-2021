import 'package:flutter/material.dart';
import 'package:flutter_study_2021/router/generate_route.dart';
import 'package:flutter_study_2021/router/name_route.dart';
import 'package:flutter_study_2021/router/pass_value_page.dart';
import 'package:flutter_study_2021/router/simple_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'name_route_1': (context) => NameRoute1(),
        'name_route_2': (context) => NameRoute2(),
        'name_route_with_param': (context) => NameRouteWithParam(),
        'name_route_with_param_constructor': (context) {
          final param = ModalRoute.of(context)?.settings.arguments;
          String value = '';
          if (param != null && param is String) {
            value = param;
          }
          return NameRouteWithParamInConstructor(param: value);
        },
        '/': (context) => MyHomePage(title: 'Router Demo Home Page'),
      },
      // 设置默认启动页：
      // 1、在 routes 中使用 “/” 命名的路由
      // 2、在 initialRoute 中指定的命名路由
      // 3、使用 home 制定 widget
      // initialRoute: '/',
      // home: MyHomePage(title: 'Router Demo Home Page'),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute(builder: (context) {
          final name = routeSettings.name;
          final arguments = routeSettings.arguments;
          return GenerateRoute(
            routeName: name,
            arguments: arguments,
          );
        });
      },
      navigatorObservers: [],
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
  // 路由数据传递返回
  String? _passValueResult;

  // 这里不可以用 String，不然会报
  // type 'MaterialPageRoute<dynamic>' is not a subtype of type 'Route<String>?' in type cast
  var _nameRouteWithParamResult;

  // 这里不可以用 String，不然会报
  // type 'MaterialPageRoute<dynamic>' is not a subtype of type 'Route<String>?' in type cast
  var _nameRouteWithParamInConstructorResult;

  var _noNameRouteResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(),
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    // 简单页面跳转
    children.add(
      TextButton(
        child: Text('open simple route'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SimplePage();
              },
            ),
          );
        },
      ),
    );

    // 值传递
    children.add(
      TextButton(
        child: Text("pass value route: ${_passValueResult ?? '无数据'}"),
        onPressed: () async {
          _passValueResult = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PassValueRoute(
                  text: 'zinc',
                );
              },
            ),
          );
          setState(() {});
        },
      ),
    );

    /// 命名路由
    children.add(
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'name_route_1');
        },
        child: Text('开启命名路由 1'),
      ),
    );
    children.add(
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, 'name_route_2');
        },
        child: Text('开启命名路由 2'),
      ),
    );
    children.add(
      TextButton(
        onPressed: () async {
          _nameRouteWithParamResult = await Navigator.pushNamed(
            context,
            'name_route_with_param',
            arguments: '江澎涌',
          );
          setState(() {});
        },
        child: Text("开启命名路由携带参数，返回参数：${_nameRouteWithParamResult ?? 'null'}"),
      ),
    );
    children.add(
      TextButton(
        onPressed: () async {
          _nameRouteWithParamInConstructorResult = await Navigator.pushNamed(
            context,
            'name_route_with_param_constructor',
            arguments: '江澎涌',
          );
          setState(() {});
        },
        child: Text(
          '开启命名路由携带参数(构造函数传入)，返回参数：$_nameRouteWithParamInConstructorResult',
        ),
      ),
    );

    // onGenerate
    children.add(
      TextButton(
        onPressed: () async {
          _noNameRouteResult = await Navigator.pushNamed(
            context,
            'no_name_route',
            arguments: 'jiang',
          );
          setState(() {});
        },
        child: Text('开启路由表中无设置的路由：$_noNameRouteResult'),
      ),
    );

    return children;
  }
}
