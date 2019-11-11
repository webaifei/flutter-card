import 'package:card_xiaomei/ui/page/AddCard.dart';
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
                  // 不同状态判断
                  new ClipRRect(
                    child: Image.network(
                      "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/104058/13/1568/77228/5dc23940E65ccd39a/cd1214a1c1dbdde6.jpg!cr_1125x445_0_171!q70.jpg.dpg",
                      fit: BoxFit.cover,
                      width: ScreenUtil.instance.setWidth(110),
                      height: ScreenUtil.instance.setWidth(110),
                    ),
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(110)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: ScreenUtil.instance.setHeight(30)),
                    child: SU.getText(
                        "立即登录", SU.color333, SU.font17, FontWeight.bold),
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
      body: Container(
        child: Column(
          children: <Widget>[
            // 无卡
            new CardPanel(
              child: new NoCard(),
            ),
            new CardPanel(
              colors: [Color(0xffe7d889), Color(0xffe1c739)],
              child: new BankCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  const BankCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.instance.setHeight(33),
        left: ScreenUtil.instance.setHeight(33),
        right: ScreenUtil.instance.setHeight(33),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/湛江商行.png",
                    width: ScreenUtil.instance.setWidth(58),
                    height: ScreenUtil.instance.setWidth(58),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(22),
                      right: ScreenUtil.instance.setWidth(16),
                    ),
                    child: SU.getText(
                        "招商银行", Colors.white, SU.font17, FontWeight.bold),
                  ),
                  SU.getText("金卡", Colors.white, SU.font14),
                ],
              ),
              SU.getText("还款日：每月15号", Colors.white, SU.font12)
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(28)),
            child: Text(
              "6548   ****   ****   8888",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: SU.font19,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil.instance.setHeight(50),
              bottom: ScreenUtil.instance.setHeight(20),
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/quanyi.png",
                  width: ScreenUtil.instance.setWidth(24),
                  height: ScreenUtil.instance.setWidth(22),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(12)),
                  child: SU.getText("海底捞50元购100元电子权益", Colors.white, SU.font12),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/quanyi.png",
                    width: ScreenUtil.instance.setWidth(24),
                    height: ScreenUtil.instance.setWidth(22),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: ScreenUtil.instance.setWidth(12)),
                    child: SU.getText("境外消费2%返现", Colors.white, SU.font12),
                  ),
                ],
              ),
              SU.getText("YOUNG卡白色青年版", Colors.white, SU.font12),
            ],
          ),
        ],
      ),
    );
  }
}

class CardPanel extends StatelessWidget {
  const CardPanel({
    Key key,
    @required this.child,
    this.colors = const [Color(0xffA8AEC4), Color(0xff7D8498)],
  }) : super(key: key);

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(ScreenUtil.instance.setWidth(8))),
      margin: EdgeInsets.only(
        top: ScreenUtil.instance.setHeight(26),
        left: ScreenUtil.instance.setHeight(26),
        right: ScreenUtil.instance.setHeight(26),
        bottom: ScreenUtil.instance.setHeight(61),
      ),
      height: ScreenUtil.instance.setHeight(328),
      child: child,
    );
  }
}

class NoCard extends StatelessWidget {
  const NoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: SU.getText("便捷记录卡片信息   详细了解此卡权益", Colors.white, SU.font19),
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(61),
            bottom: ScreenUtil.instance.setHeight(30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/nianfei.png",
              width: ScreenUtil.instance.setWidth(24),
              height: ScreenUtil.instance.setWidth(24),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(10),
                right: ScreenUtil.instance.setWidth(40),
              ),
              child: SU.getText("年费", Colors.white, SU.font14),
            ),
            Image.asset(
              "assets/images/积分.png",
              width: ScreenUtil.instance.setWidth(24),
              height: ScreenUtil.instance.setWidth(24),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(10),
                right: ScreenUtil.instance.setWidth(40),
              ),
              child: SU.getText("积分", Colors.white, SU.font14),
            ),
            Image.asset(
              "assets/images/quanyi.png",
              width: ScreenUtil.instance.setWidth(24),
              height: ScreenUtil.instance.setWidth(24),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(10),
              ),
              child: SU.getText("权益", Colors.white, SU.font14),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(34)),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardPage()),
                )
              },
              child: Container(
                width: ScreenUtil.instance.setWidth(400),
                height: ScreenUtil.instance.setHeight(60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      size: ScreenUtil.instance.setWidth(50),
                      color: Color(0xff7E8599),
                    ),
                    SU.getText(
                      "添加信用卡",
                      Color(0xff7D8498),
                      SU.font19,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
