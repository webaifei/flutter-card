import 'package:flutter/material.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 添加卡片
class SelectCardPage extends StatefulWidget {
  @override
  _SelectCardPageState createState() => _SelectCardPageState();
}

class _SelectCardPageState extends State<SelectCardPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
        appBar: AppBar(
          title: SU.getText("选择卡面"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              new CardNumShow(),
              new DropMenu(),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: ScreenUtil.instance.setWidth(5),
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setHeight(15),
                        right: ScreenUtil.instance.setHeight(15),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  "http://pic1.win4000.com//pic/f/89/2ad2d69a34.jpg",
                                  width: ScreenUtil.instance.setWidth(327),
                                  height: ScreenUtil.instance.setWidth(208),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: ScreenUtil.instance.setWidth(25),
                                right: ScreenUtil.instance.setWidth(25),
                                child: Image.asset(
                                  "assets/images/kaxuanzhong.png",
                                  width: ScreenUtil.instance.setWidth(40),
                                  height: ScreenUtil.instance.setWidth(40),
                                ),
                              )
                            ]),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(8),
                                  bottom: ScreenUtil.instance.setHeight(8),
                                ),
                                child: Text(
                                  "招行神偷奶爸系列信用卡招行神偷奶爸系列信用卡",
                                  style: TextStyle(
                                    color: SU.color333,
                                    fontSize: SU.font14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setHeight(15),
                        right: ScreenUtil.instance.setHeight(15),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  "http://pic1.win4000.com//pic/f/89/2ad2d69a34.jpg",
                                  width: ScreenUtil.instance.setWidth(327),
                                  height: ScreenUtil.instance.setWidth(208),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: ScreenUtil.instance.setWidth(25),
                                right: ScreenUtil.instance.setWidth(25),
                                child: Image.asset(
                                  "assets/images/kaweixuan.png",
                                  width: ScreenUtil.instance.setWidth(40),
                                  height: ScreenUtil.instance.setWidth(40),
                                ),
                              )
                            ]),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(8),
                                  bottom: ScreenUtil.instance.setHeight(8),
                                ),
                                child: Text(
                                  "招行神偷奶爸系列信用卡招行神偷奶爸系列信用卡",
                                  style: TextStyle(
                                    color: SU.color333,
                                    fontSize: SU.font14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setHeight(15),
                        right: ScreenUtil.instance.setHeight(15),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  "http://pic1.win4000.com//pic/f/89/2ad2d69a34.jpg",
                                  width: ScreenUtil.instance.setWidth(327),
                                  height: ScreenUtil.instance.setWidth(208),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: ScreenUtil.instance.setWidth(25),
                                right: ScreenUtil.instance.setWidth(25),
                                child: Image.asset(
                                  "assets/images/kaxuanzhong.png",
                                  width: ScreenUtil.instance.setWidth(40),
                                  height: ScreenUtil.instance.setWidth(40),
                                ),
                              )
                            ]),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(8),
                                  bottom: ScreenUtil.instance.setHeight(8),
                                ),
                                child: Text(
                                  "招行神偷奶爸系列信用卡招行神偷奶爸系列信用卡",
                                  style: TextStyle(
                                    color: SU.color333,
                                    fontSize: SU.font14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setHeight(15),
                        right: ScreenUtil.instance.setHeight(15),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  "http://pic1.win4000.com//pic/f/89/2ad2d69a34.jpg",
                                  width: ScreenUtil.instance.setWidth(327),
                                  height: ScreenUtil.instance.setWidth(208),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: ScreenUtil.instance.setWidth(25),
                                right: ScreenUtil.instance.setWidth(25),
                                child: Image.asset(
                                  "assets/images/kaxuanzhong.png",
                                  width: ScreenUtil.instance.setWidth(40),
                                  height: ScreenUtil.instance.setWidth(40),
                                ),
                              )
                            ]),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(8),
                                  bottom: ScreenUtil.instance.setHeight(8),
                                ),
                                child: Text(
                                  "招行神偷奶爸系列信用卡招行神偷奶爸系列信用卡",
                                  style: TextStyle(
                                    color: SU.color333,
                                    fontSize: SU.font14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // listview
              Container(
                width: double.infinity,
                height: ScreenUtil.instance.setHeight(92),
                margin: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(31),
                  right: ScreenUtil.instance.setWidth(31),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: SU.colore6,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "全部系列",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: SU.color333, fontSize: SU.font16,),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenUtil.instance.setHeight(92),
                margin: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(31),
                  right: ScreenUtil.instance.setWidth(31),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: SU.colore6,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "全部系列",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: SU.colorYellow, fontSize: SU.font16,),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenUtil.instance.setHeight(92),
                margin: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(31),
                  right: ScreenUtil.instance.setWidth(31),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: SU.colore6,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "全部系列",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: SU.color333, fontSize: SU.font16,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class DropMenu extends StatelessWidget {
  const DropMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(100),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: SU.colore6,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "卡系列",
                  style: TextStyle(
                    color: SU.colorYellow,
                    fontSize: SU.font16,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(24)),
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    size: ScreenUtil.instance.setWidth(28),
                    color: SU.colorYellow,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "卡等级",
                  style: TextStyle(
                    color: SU.color333,
                    fontSize: SU.font16,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(24)),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: ScreenUtil.instance.setWidth(28),
                    color: SU.color666,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardNumShow extends StatelessWidget {
  const CardNumShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffF4F6F7),
      padding: EdgeInsets.only(
        top: ScreenUtil.instance.setHeight(20),
        bottom: ScreenUtil.instance.setHeight(20),
        left: ScreenUtil.instance.setHeight(30),
      ),
      child: RichText(
        text: TextSpan(
            text: "已为您筛选到",
            style: TextStyle(
              color: SU.color666,
              fontSize: SU.font12,
            ),
            children: [
              TextSpan(
                  text: "118",
                  style: TextStyle(
                    color: SU.colorYellow,
                    fontSize: SU.font12,
                  )),
              TextSpan(
                text: "张卡",
                style: TextStyle(
                  color: SU.color666,
                  fontSize: SU.font12,
                ),
              ),
            ]),
      ),
    );
  }
}
