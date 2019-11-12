import 'package:flutter/material.dart';


class InheritedProvider extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final data;

  @override
  bool updateShouldNotify(InheritedProvider old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}
/// 简单版本的Provider实现
/// 1.利用InheriedWidget 的特性
///
class ChangeNotiferProvier extends  StatefulWidget{

  // Model类型
  final data;
  final Widget child;

  ChangeNotiferProvier(this.data, this.child);

  static  of (BuildContext context) {
    final provider = context.inheritFromWidgetOfExactType(InheritedProvider);
    return provider;
  }
  @override
  _ChangeNotiferProvierState createState() => _ChangeNotiferProvierState();
}

class _ChangeNotiferProvierState extends State<ChangeNotiferProvier> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}
