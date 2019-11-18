import 'dart:async';

import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:card_xiaomei/ui/widget/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const COUNT_NUM = 60;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Timer timer;
  int count = COUNT_NUM;

  String countBtnString = "获取验证码";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer != null ?? timer.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 30,
                top: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: ScreenUtil.instance.setWidth(40),
                    color: Color(0xFF424141),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenUtil.screenHeightDp -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Hero(
                        tag: "avatar",
                        child: Image.asset(
                          "assets/images/logo.jpg",
                          width: ScreenUtil.instance.setWidth(180),
                          height: ScreenUtil.instance.setWidth(162),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SU.getText(
                          "TK卡百科", SU.color333, SU.font20, FontWeight.bold),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(74),
                        left: ScreenUtil.instance.setWidth(74),
                        right: ScreenUtil.instance.setWidth(74),
                      ),
                      child: SU.getText("手机验证码快捷登录", SU.colorWarning, SU.font16,
                          FontWeight.bold),
                    ),
                    // 输入框
                    Form(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil.instance.setHeight(12),
                          left: ScreenUtil.instance.setWidth(74),
                          right: ScreenUtil.instance.setWidth(74),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              style: SU.title,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(28),
                                  bottom: ScreenUtil.instance.setHeight(28),
                                ),
                                hintText: "请输入手机号",
                                hintStyle: TextStyle(
                                  color: SU.colorccc,
                                  fontSize: SU.font14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              color: SU.colore6,
                              thickness: 1,
                              height: 0,
                            ),
                            Container(
                              width: ScreenUtil.instance
                                  .setWidth(ScreenUtil.screenWidth - 74 * 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: ScreenUtil.instance.setWidth(400),
                                    child: TextField(
                                      style: SU.title,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            top: ScreenUtil.instance
                                                .setHeight(28),
                                            bottom: ScreenUtil.instance
                                                .setHeight(28),
                                          ),
                                          hintText: "请输入短信验证码",
                                          hintStyle: TextStyle(
                                            color: SU.colorccc,
                                            fontSize: SU.font14,
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Material(
                                    child: InkWell(
                                      onTap: () {
                                        startCount();
                                      },
                                      child: Container(
                                        width:
                                            ScreenUtil.instance.setWidth(160),
                                        height:
                                            ScreenUtil.instance.setHeight(60),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: SU.colorWarning),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            countBtnString,
                                            style: TextStyle(
                                              color: SU.colorWarning,
                                              fontSize: SU.font14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: SU.colore6,
                              thickness: 1,
                              height: 0,
                            ),
                            // 登录按钮
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(84)),
                              child: new Button(
                                text: "登 录",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // 协议
              Positioned(
                bottom: ScreenUtil.instance.setHeight(45),
                width: ScreenUtil.instance.setWidth(750),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "登录即表示同意",
                      style: TextStyle(
                        color: SU.colorccc,
                        fontSize: SU.font12,
                      ),
                      children: [
                        TextSpan(
                          text: "《用户服务协议》",
                          style: TextStyle(
                            color: SU.color999,
                            fontSize: SU.font12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 倒计时
  void startCount() {
    // fetch api
    // success countdown
    if (count == COUNT_NUM) {
      if (timer != null && timer.isActive) {
        timer.cancel();
      }
      // 倒计时
      timer = new Timer.periodic(Duration(milliseconds: 1000), (timer) {
        if (count == 0) {
          setState(() {
            count = COUNT_NUM;
            countBtnString = "获取验证码";
          });
          if (timer.isActive) {
            timer.cancel();
          }
        } else {
          setState(() {
            count--;
            countBtnString = "${count + 1}s";
          });
        }
      });
    }
  }
}
