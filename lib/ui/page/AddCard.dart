import 'package:card_xiaomei/ui/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 添加卡片
class AddCardPage extends StatefulWidget {
  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      appBar: AppBar(
        title: SU.getText("添加新卡"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Divider(
              height: ScreenUtil.instance.setHeight(20),
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(31),
                  right: ScreenUtil.instance.setWidth(31),
                ),
                child: Column(
                  children: <Widget>[
                    new Input(text: "卡类型", readOnly: true, initialValue: "信用卡"),
                    new Input(
                      text: "银行",
                      readOnly: true,
                      hintText: "请选择银行",
                      suffix: Image.asset(
                        "assets/images/right_arrow_circle.png",
                        width: ScreenUtil.instance.setWidth(24),
                        height: ScreenUtil.instance.setWidth(24),
                      ),
                    ),
                    new Input(
                      text: "卡名称",
                      hintText: "请选择卡片",
                      readOnly: true,
                      suffix: Image.asset(
                        "assets/images/right_arrow_circle.png",
                        width: ScreenUtil.instance.setWidth(24),
                        height: ScreenUtil.instance.setWidth(24),
                      ),
                    ),
                    new Input(
                      text: "卡号",
                      hintText: "请输入卡号",
                    ),
                    new Input(
                      text: "还款日",
                      hintText: "请选择还款日",
                      readOnly: true,
                    ),
                    new Input(
                      text: "账单日",
                      hintText: "请选择账号日",
                      readOnly: true,
                    ),
                    new Input(
                      hintText: "请输入卡额度",
                      text: "卡额度",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(100)),
              child: new Button(
                text: "完成",
                onTap: () {
                  print("添加卡片");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input(
      {Key key,
      this.readOnly = false,
      this.suffix,
      @required this.text,
      this.hintText,
      this.initialValue = "",
      this.onTap})
      : super(key: key);

  final bool readOnly;

  final Widget suffix;

  final String text;

  final String hintText;

  final String initialValue;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(98),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: SU.colore6,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil.instance.setWidth(146),
            child: Text(
              text,
              style: TextStyle(
                color: SU.color666,
                fontSize: SU.font16,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              onTap: onTap,
              style: TextStyle(
                color: SU.color333,
                fontSize: SU.font16,
              ),
              readOnly: readOnly,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hintText),
            ),
          ),
          suffix != null ? suffix : SizedBox.shrink()
        ],
      ),
    );
  }
}
