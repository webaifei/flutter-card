import 'package:card_xiaomei/common/API.dart';
import 'package:card_xiaomei/common/constants.dart';
import 'package:card_xiaomei/common/setupLocator.dart';
import 'package:card_xiaomei/model/Bank.dart';
import 'package:card_xiaomei/model/BankCardModel.dart';
import 'package:card_xiaomei/model/bank_list_entity.dart';
import 'package:card_xiaomei/model/home_model_entity.dart';
import 'package:card_xiaomei/ui/page/Home.dart';
import 'package:card_xiaomei/ui/page/SelectCard.dart';
import 'package:card_xiaomei/ui/widget/Button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

enum PICKER_TYPE {
  BANK,
  DATE,
  BILL,
}

/// 添加卡片
class AddCardPage extends StatefulWidget {
  HomeModelEntity homeModelEntity = locator.get<HomeModelEntity>();
  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final List<Bank> bankList = [];
  Map<String, String> cardInfo = {
    "payDate": "",
    "payDateStr": "",
    "bankName": "",
    "bankId": "",
    "billDateStr": "",
    "billDate": "",
    "amount": ""
  };
  String bankName = "";

  @override
  void initState() {
    getBankList();
    super.initState();
    Future.delayed(new Duration(milliseconds: 3000)).then((res) {
      setState(() {
        bankName = "招商银行";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("----build----");
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      appBar: AppBar(
        title: SU.getText("添加新卡"),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      new Input(text: "卡类型", readOnly: true, inputValue: "信用卡"),
                      new Input(
                        text: "银行",
                        readOnly: true,
                        hintText: "请选择银行",
                        inputValue: bankName,
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: _builder(context, PICKER_TYPE.BANK),
                          );
                        },
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
                        onTap: () {
                          Navigator.of(context).pushNamed("selectCard");
                        },
                      ),
                      new Input(
                        text: "卡号",
                        hintText: "请输入卡号",
                        keyboardType: TextInputType.number,
                        inputValue: cardInfo["cardNo"],
                      ),
                      new Input(
                        text: "还款日",
                        hintText: "请选择还款日",
                        readOnly: true,
                        inputValue: cardInfo["payDateStr"],
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: _builder(context, PICKER_TYPE.DATE),
                          );
                        },
                      ),
                      new Input(
                        text: "账单日",
                        hintText: "请选择账单日",
                        readOnly: true,
                        inputValue: cardInfo["billDateStr"],
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: _builder(context, PICKER_TYPE.BILL),
                          );
                        },
                      ),
                      new Input(
                        hintText: "请输入卡额度",
                        text: "卡额度",
                        keyboardType: TextInputType.number,
                        inputValue: cardInfo["amount"],
                        onChange: (String text) {
                          setState(() {
                            cardInfo["amount"] = text;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: ScreenUtil.instance.setHeight(100)),
                child: new Button(
                  text: "完成",
                  onTap: addCard,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getBankList() async {
    try {
      Response res = await API.getBankList();
      BankListEntity bankListEntity = BankListEntity.fromJson(res.data["data"]);
      setState(() {
        bankList.addAll(bankListEntity.bankList);
      });
    } catch (err) {}
  }

  // 添加卡片
  void addCard() async {
    print(cardInfo);
    // 检测数据项
    Map<String, dynamic> res = checkData();
    if (!res["isOk"]) {
      showToast(res["msg"]);
      return;
    }
    try {
      // loading
//      showToastWidget(
//        SizedBox(
//          width: ScreenUtil.instance.setWidth(100),
//          height: ScreenUtil.instance.setWidth(100),
//          child: Container(
//            color: SU.colorYellow,
//            child: Text("加载中...", style: TextStyle(
//              color: SU.color333,
//              fontSize: SU.font16,
//            ),),
//          ),
//        )
//      );
      // fetch api
      Response cardInfo = await API.addCard(res["data"]);
      // 更新到state
      BankCardModel bankCardModel =
          BankCardModel.fromJson(cardInfo.data["data"]);
      widget.homeModelEntity.addCard(bankCardModel);
      // 返回主页
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
    }
  }

  List<Widget> _buildPickerList({PICKER_TYPE type}) {
    List<Widget> list = [
      Center(
        child: Text(
          "",
          style: TextStyle(
            color: SU.color333,
            fontSize: SU.font16,
          ),
        ),
      )
    ];
    switch (type) {
      case PICKER_TYPE.BANK:
        bankList.forEach((item) {
          list.add(Center(
            child: Text(
              item.title,
              style: TextStyle(
                color: SU.color333,
                fontSize: SU.font16,
              ),
            ),
          ));
        });
        break;
      case PICKER_TYPE.DATE:
      case PICKER_TYPE.BILL:
        Config.date.forEach((item) {
          list.add(Center(
            child: Text(
              "${item.toString()}号",
              style: TextStyle(
                color: SU.color333,
                fontSize: SU.font16,
              ),
            ),
          ));
        });
        break;
      default:
        break;
    }

    return list;
  }

  // 构建picker builder
  _builder(BuildContext context, PICKER_TYPE type) {
    return (context) {
      return SizedBox(
        height: ScreenUtil.instance.setHeight(400),
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: ScreenUtil.instance.setHeight(90),
          onSelectedItemChanged: (index) {
            setChangeValue(index, type);
          },
          children: _buildPickerList(type: type),
        ),
      );
    };
  }

  void setChangeValue(int index, PICKER_TYPE type) {
    print(index);
    print("picker index");
    if (index == 0) return;
    index -= 1;
    switch (type) {
      case PICKER_TYPE.BANK:
        cardInfo["bankName"] = bankList[index].title;

        setState(() {
          bankName = bankList[index].title;
        });
        cardInfo["bankId"] = bankList[index].id;
        break;
      case PICKER_TYPE.BILL:
        cardInfo["billDateStr"] = "每月${Config.date[index]}日";
        cardInfo["billDate"] = Config.date[index].toString();
        break;
      case PICKER_TYPE.DATE:
        cardInfo["payDateStr"] = "每月${Config.date[index]}日";
        cardInfo["payDate"] = "${Config.date[index]}";
        break;
      default:
        break;
    }
    setState(() {});
  }

  Map<String, dynamic> checkData() {
    Map<String, dynamic> res = {"isOk": true, "msg": "ok"};
    if (cardInfo["bankId"].isEmpty) {
      res["isOk"] = false;
      res["msg"] = "请选择银行";
      return res;
    }
    if (cardInfo["cardNo"] != null && cardInfo["cardNo"].isEmpty) {
      res["isOk"] = false;
      res["msg"] = "请输入银行卡号";
      return res;
    }
    if (cardInfo["payDate"] != null && cardInfo["payDate"].isEmpty) {
      res["isOk"] = false;
      res["msg"] = "请选择还款日";
      return res;
    }
    if (cardInfo["billDate"] != null && cardInfo["billDate"].isEmpty) {
      res["isOk"] = false;
      res["msg"] = "请选择账单日";
      return res;
    }
    if (cardInfo["amount"] != null && cardInfo["amount"].isEmpty) {
      res["isOk"] = false;
      res["msg"] = "请输入额度";
      return res;
    }
    return res;
  }
}

/// 输入组价 怎么实现 双向绑定
/// 1. 组件内部的修改 通知到外部
/// 2. 外部的修改 通知到内部
class Input extends StatefulWidget {
  Input(
      {Key key,
      this.readOnly = false,
      this.suffix,
      this.keyboardType,
      @required this.text,
      this.hintText,
      this.inputValue = "",
      this.onTap,
      this.onChange})
      : super(key: key);

  final bool readOnly;

  final Widget suffix;

  final String text;

  final String hintText;

  final String inputValue;

  final TextInputType keyboardType;

  final onChange;

  final GestureTapCallback onTap;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    _textEditingController.text = widget.inputValue;
    _textEditingController.addListener(() {
      //_textEditingController.text;
      if (widget.onChange != null) {
        widget.onChange(_textEditingController.text);
      }
    });
    super.initState();
  }

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
              widget.text,
              style: TextStyle(
                color: SU.color666,
                fontSize: SU.font16,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: widget.onTap,
              child: widget.readOnly
                  ? Text(
                      widget.inputValue != ""
                          ? widget.inputValue
                          : widget.hintText,
                      style: TextStyle(
                        color: SU.color333,
                        fontSize: SU.font16,
                      ),
                    )
                  : TextField(
                      controller: _textEditingController,
                      keyboardType: widget.keyboardType,
                      style: TextStyle(
                        color: SU.color333,
                        fontSize: SU.font16,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: widget.hintText),
                    ),
            ),
          ),
          widget.suffix != null ? widget.suffix : SizedBox.shrink()
        ],
      ),
    );
  }
}
