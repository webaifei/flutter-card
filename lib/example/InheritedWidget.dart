import 'package:flutter/material.dart';

/// 依赖InheritedWidget 类来实现
/// 1. 需要持有共享状态的组件继承InheritedWidget
/// 2. 提供一个获取该组件实例的静态方法，同时也可以提供共享状态 CRUD 操作
/// 3. 在子组件中通过静态方法获取到当前子组件中的祖先组件实例 从而获取共享状态和对应操作
///


class ShareDataWidget extends InheritedWidget {
  final updateCount;

  ShareDataWidget({Widget child, this.data = const {"count": 0},  this.updateCount})
      : super(child: child);

  Map data; // 共享的数据

  // 提供静态方法 获取组件的共享数据
  static ShareDataWidget of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(ShareDataWidget);
    // 这个不会将祖先组件和当前组件绑定依赖关系 子组件的didChangeDependencies 不会触发
    return context
        .ancestorInheritedElementForWidgetOfExactType(ShareDataWidget)
        .widget;
  }

  // 通知依赖共享状态的子树
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // 忽略判断
    return true;
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  @override
  _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int count = 0;

  void updateCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const keyName = "count";
    return Scaffold(
      body: SafeArea(
        child: ShareDataWidget(
          // map的key可以是变量 和js中不同（js中需要用[]）
          data: {keyName: count},
          updateCount: updateCount,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100),
              ),
              TestStateless(),
              TestOfStateful(),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestOfStateful extends StatefulWidget {
  @override
  _TestOfStatefulState createState() => _TestOfStatefulState();
}

class _TestOfStatefulState extends State<TestOfStateful> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("change");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            ShareDataWidget.of(context).data["count"].toString(),
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            child: Text("inner button add+"),
            onPressed: (){
              ShareDataWidget.of(context).updateCount();
            },
          )
        ],
      ),
    );
  }
}

class TestStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ShareDataWidget.of(context).data["count"].toString(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
