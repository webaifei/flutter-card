import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DropDownMenuController.dart';

/// 如何执行动画
/// 使用订阅发布的方式
class DropDownPage extends StatefulWidget {
  final DropDownMenuController controller;

  final Widget child;

  const DropDownPage({this.controller, this.child});

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage>
    with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animationOpacity;
  AnimationController controller;

  double panelHeight = 0;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // TODO: 重复代码
    animation = new Tween(
      begin: 0.0,
      end: ScreenUtil.screenHeightDp - ScreenUtil.instance.setWidth(92) * 6,
    ).animate(curve)
      ..addListener(() {
        setState(() => {});
      });
    animationOpacity = new Tween(
      begin: 0.0,
      end: 0.6,
    ).animate(controller)
      ..addListener(() {
        setState(() => {});
      });

    controller.addStatusListener((status) {
      print("---status");
      print(status);
      if (status == AnimationStatus.forward) {
        setState(() {
          panelHeight = ScreenUtil.screenHeightDp;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          panelHeight = 0;
        });
      }
    });
    widget.controller.addListener(tabClickHandler);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Positioned(
      width: ScreenUtil.screenWidth,
      top: ScreenUtil.instance.setHeight(140) + 12,
      left: 0,
      child: Column(
        children: <Widget>[
          Container(
            height: animation.value,
            color: Colors.white,
            child: widget.child,
          ),
          Container(
            height: panelHeight,
            color: Color.fromRGBO(0, 0, 0, animationOpacity.value),
          )
        ],
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  void tabClickHandler() {
    print(animation.status);
    print(widget.controller.isShow);
    if (animation.status == AnimationStatus.completed) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }
}
