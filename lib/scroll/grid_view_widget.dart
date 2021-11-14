import 'package:flutter/material.dart';
import 'package:flutter_study_2021/layout/responsive_column.dart';

/// GridView 的使用 SliverGridDelegateWithFixedCrossAxisCount
class GridViewFixedCrossAxisCountWidget extends StatelessWidget {
  const GridViewFixedCrossAxisCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // 横轴三个子 widget
              crossAxisCount: 3,
              // 宽高比为1时，子 widget
              childAspectRatio: 1.0,
              // 主轴的间隔
              mainAxisSpacing: 10,
              // 次轴的间隔
              crossAxisSpacing: 20,
              // item 的主轴方向上的像素高度，如果不设置则有 childAspectRatio 确定
              mainAxisExtent: 200,
            ),
            children: <Widget>[
              _getIconWidget(Icons.ac_unit),
              _getIconWidget(Icons.airport_shuttle),
              _getIconWidget(Icons.all_inclusive),
              _getIconWidget(Icons.beach_access),
              _getIconWidget(Icons.cake),
              _getIconWidget(Icons.free_breakfast)
            ]),
      ),
    );
  }

  Widget _getIconWidget(IconData iconData) {
    return Container(
      color: Colors.redAccent,
      child: Icon(iconData),
    );
  }
}

/// 构造函数 GridView.count
class GridViewWithCountWidget extends StatelessWidget {
  const GridViewWithCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            children: <Widget>[
              _getIconWidget(Icons.ac_unit),
              _getIconWidget(Icons.airport_shuttle),
              _getIconWidget(Icons.all_inclusive),
              _getIconWidget(Icons.beach_access),
              _getIconWidget(Icons.cake),
              _getIconWidget(Icons.free_breakfast)
            ]),
      ),
    );
  }

  Widget _getIconWidget(IconData iconData) {
    return Container(
      color: Colors.redAccent,
      child: Icon(iconData),
    );
  }
}

/// GridView 的使用 SliverGridDelegateWithMaxCrossAxisExtent
class GridViewMaxCrossAxisExtentWidget extends StatelessWidget {
  const GridViewMaxCrossAxisExtentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("size: ${MediaQuery.of(context).size}");
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80.0,
              // 宽高比为 2
              childAspectRatio: 2.0,
              // 主轴的间隔
              mainAxisSpacing: 10,
              // 次轴的间隔
              crossAxisSpacing: 20,
              // item 的主轴方向上的像素高度，如果不设置则有 childAspectRatio 确定
              // mainAxisExtent: 200,
            ),
            children: <Widget>[
              _getIconWidget(Icons.ac_unit),
              _getIconWidget(Icons.airport_shuttle),
              _getIconWidget(Icons.all_inclusive),
              _getIconWidget(Icons.beach_access),
              _getIconWidget(Icons.cake),
              _getIconWidget(Icons.free_breakfast)
            ]),
      ),
    );
  }

  Widget _getIconWidget(IconData iconData) {
    return LayoutLogPrint(
      child: Container(
        color: Colors.redAccent,
        child: Icon(iconData),
      ),
    );
  }
}

/// 构造函数 GridView.extent
class GridViewWithExtentWidget extends StatelessWidget {
  const GridViewWithExtentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: GridView.extent(
            maxCrossAxisExtent: 80.0,
            childAspectRatio: 2.0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            children: <Widget>[
              _getIconWidget(Icons.ac_unit),
              _getIconWidget(Icons.airport_shuttle),
              _getIconWidget(Icons.all_inclusive),
              _getIconWidget(Icons.beach_access),
              _getIconWidget(Icons.cake),
              _getIconWidget(Icons.free_breakfast)
            ]),
      ),
    );
  }

  Widget _getIconWidget(IconData iconData) {
    return Container(
      color: Colors.redAccent,
      child: Icon(iconData),
    );
  }
}

/// GridView.builder
class GridViewWithBuilderWidget extends StatefulWidget {
  const GridViewWithBuilderWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWithBuilderWidget> createState() =>
      _GridViewWithBuilderWidgetState();
}

class _GridViewWithBuilderWidgetState extends State<GridViewWithBuilderWidget> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 每行三列
          childAspectRatio: 1.0, // 显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          // 如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return _getIconWidget(_icons[index]);
        },
      ),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }

  Widget _getIconWidget(IconData iconData) {
    return Container(
      color: Colors.redAccent,
      child: Icon(iconData),
    );
  }
}
