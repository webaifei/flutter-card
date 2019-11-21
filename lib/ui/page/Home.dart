import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:card_xiaomei/model/home_model_entity.dart';

import 'package:card_xiaomei/ui/page/AddCard.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:card_xiaomei/model/BankCardModel.dart';

import 'package:card_xiaomei/common/setupLocator.dart';

/// 首页
class HomePage extends StatefulWidget {
  HomeModelEntity homeModelEntity = locator.get<HomeModelEntity>();

  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.homeModelEntity.fetchCardList();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ScopedModel<HomeModelEntity>(
      model: widget.homeModelEntity,
      child: Scaffold(
        drawer: new DrawerPanel(),
        appBar: AppBar(
          title: ScopedModelDescendant<HomeModelEntity>(
              builder: (context, child, model) => SU.getText(model.title)),
        ),
        body: ScopedModelDescendant<HomeModelEntity>(
          builder: (context, child, model) => SingleChildScrollView(
            child: Container(
              child: Column(
                children: buildCardList(context, model),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 获取卡列表视图
  List<Widget> buildCardList(BuildContext context, HomeModelEntity model) {
    print(model.cardList);
    List<Widget> list = [
      new CardPanel(
        child: new NoCard(),
      ),
    ];
    // 遍历cardlist  添加卡片
    model.cardList?.forEach((item) {
      list.insert(
        0,
        new CardPanel(
          colors: [Color(0xffe7d889), Color(0xffe1c739)],
          child: new BankCard(card: item),
        ),
      );
    });

    return list;
  }
}

class DrawerPanel extends StatelessWidget {
  const DrawerPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 不同状态判断
                Hero(
                  tag: "avatar",
                  child: new ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/104058/13/1568/77228/5dc23940E65ccd39a/cd1214a1c1dbdde6.jpg!cr_1125x445_0_171!q70.jpg.dpg",
                      fit: BoxFit.cover,
                      width: ScreenUtil.instance.setWidth(110),
                      height: ScreenUtil.instance.setWidth(110),
                      placeholder: (context, url) => new Loading(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(110)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(30)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "login");
                    },
                    child: SU.getText(
                        "立即登录", SU.color333, SU.font17, FontWeight.bold),
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
    );
  }
}

class Loading extends StatelessWidget {
  final double width;
  final double height;

  const Loading({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : ScreenUtil.instance.setWidth(30),
      height: height != null ? height : ScreenUtil.instance.setWidth(30),
      alignment: Alignment.center,
      child: SizedBox(
        width: ScreenUtil.instance.setWidth(30),
        height: ScreenUtil.instance.setWidth(30),
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  final BankCardModel card;

  const BankCard({
    Key key,
    @required this.card,
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
                  CachedNetworkImage(
                    imageUrl: card.logo,
                    width: ScreenUtil.instance.setWidth(58),
                    height: ScreenUtil.instance.setWidth(58),
                    placeholder: (context, url) => new Loading(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(22),
                      right: ScreenUtil.instance.setWidth(16),
                    ),
                    child: SU.getText(card.bankName, Colors.white, SU.font17,
                        FontWeight.bold),
                  ),
                  SU.getText(card.type, Colors.white, SU.font14),
                ],
              ),
              SU.getText("还款日：每月${card.payDay}号", Colors.white, SU.font12)
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(28)),
            child: Text(
              card.cardNum,
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
                  child: SU.getText(card.rights[0], Colors.white, SU.font12),
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
                    child: SU.getText(card.rights[1], Colors.white, SU.font12),
                  ),
                ],
              ),
              SU.getText(card.title, Colors.white, SU.font12),
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
        bottom: ScreenUtil.instance.setWidth(61),
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
