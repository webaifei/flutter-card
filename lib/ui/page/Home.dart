import 'package:flutter/material.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  CircleAvatar(
//                    backgroundImage: NetworkImage("https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/104058/13/1568/77228/5dc23940E65ccd39a/cd1214a1c1dbdde6.jpg!cr_1125x445_0_171!q70.jpg.dpg"),
//                    radius: ScreenUtil.instance.setWidth(110),
//                  ),
                  new ClipRRect(
                    child: Image.network(
                      "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/104058/13/1568/77228/5dc23940E65ccd39a/cd1214a1c1dbdde6.jpg!cr_1125x445_0_171!q70.jpg.dpg",
                      fit: BoxFit.cover,
                      width: ScreenUtil.instance.setWidth(110),
                      height: ScreenUtil.instance.setWidth(110),
                    ),
                    borderRadius: BorderRadius.circular(ScreenUtil.instance.setWidth(110)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(30)),
                    child: SU.getText(
                      "立即登录",
                      SU.color333,
                      SU.font17,
                      FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/用户协议.png",
                width: ScreenUtil.instance.setWidth(36),
                height: ScreenUtil.instance.setHeight(36),
              ),
              title: SU.getText("用户协议", SU.color333, SU.font14),
              onTap: () {
                print("xieyi");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/隐私协议.png",
                width: ScreenUtil.instance.setWidth(36),
                height: ScreenUtil.instance.setHeight(36),
              ),
              title: SU.getText("隐私协议", SU.color333, SU.font14),
              onTap: () {
                print("xieyi");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/我要反馈.png",
                width: ScreenUtil.instance.setWidth(36),
                height: ScreenUtil.instance.setHeight(36),
              ),
              title: SU.getText("我要反馈", SU.color333, SU.font14),
              onTap: () {
                print("xieyi");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/关于我们.png",
                width: ScreenUtil.instance.setWidth(36),
                height: ScreenUtil.instance.setHeight(36),
              ),
              title: SU.getText("关于我们", SU.color333, SU.font14),
              onTap: () {
                print("xieyi");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/退出账号.png",
                width: ScreenUtil.instance.setWidth(36),
                height: ScreenUtil.instance.setHeight(36),
              ),
              title: SU.getText("退出账号", SU.color333, SU.font14),
              onTap: () {
                print("xieyi");
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: SU.getText("卡小秘"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: new Icon(Icons.settings),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
