import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_xiaomei/model/BankCardModel.dart';
import 'package:card_xiaomei/model/card_tyes_list_entity.dart';
import 'package:card_xiaomei/ui/widget/dropDownMenu/DropDownMenuController.dart';
import 'package:card_xiaomei/ui/widget/dropDownMenu/DropDownPage.dart';
import 'package:card_xiaomei/ui/widget/dropDownMenu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:card_xiaomei/common/setupLocator.dart';
import 'Home.dart';

/// 添加卡片
class SelectCardPage extends StatefulWidget {
  CardTyesListEntity cardTyesListEntity = locator.get<CardTyesListEntity>();

  SelectCardPage();

  @override
  _SelectCardPageState createState() => _SelectCardPageState();
}

class _SelectCardPageState extends State<SelectCardPage> {
  DropDownMenuController _downMenuController = DropDownMenuController();

  int levelSelect = 0;

  int typeSelect = 0;

  int cardSelect = 0;

  @override
  void initState() {
    super.initState();
    widget.cardTyesListEntity.fetchCardTypes();
    widget.cardTyesListEntity.fetchAllCardList();
  }

  setCardSelect(index) {
    setState(() {
      cardSelect = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ScopedModel<CardTyesListEntity>(
      model: widget.cardTyesListEntity,
      child: Scaffold(
        appBar: AppBar(
          title: SU.getText("选择卡面"),
        ),
        body: ScopedModelDescendant<CardTyesListEntity>(
          builder: (context, child, model) => Stack(children: <Widget>[
            Column(
              children: <Widget>[
                new CardNumShow(),
                new DropMenu(
                  controller: _downMenuController,
                  cardTyesListEntity: model,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: ScreenUtil.instance.setWidth(5),
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    children: _buildList(context, model),
                  ),
                ),
              ],
            ),
            new DropDownPage(
              controller: _downMenuController,
              child: _buildDropDownList(model),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> _buildList(BuildContext context, CardTyesListEntity model) {
    List<Widget> list = model.list
        ?.asMap()
        ?.map((index, item) {
          return MapEntry(
              index,
              new CardItem(
                  cardInfo: item,
                  selected: index == cardSelect,
                  index: index,
                  onTap: setCardSelect));
        })
        ?.values
        ?.toList();
    return list != null ? list : [SizedBox.shrink()];
  }

  Widget _buildDropDownList(CardTyesListEntity model) {
    List<Widget> children;
    if (model.menuIndex == 0) {
      children = model?.types
          ?.asMap()
          ?.map((index, item) => MapEntry(
              index,
              GestureDetector(
                onTap: () {
                  tapMenuItem(index, model.menuIndex);
                },
                child: DropdownItem(
                  title: item.title,
                  isActive: index == typeSelect,
                ),
              )))
          ?.values
          ?.toList();
    } else {
      children = model?.levels
          ?.asMap()
          ?.map((index, item) => MapEntry(
              index,
              GestureDetector(
                onTap: () {
                  tapMenuItem(index, model.menuIndex);
                },
                child: DropdownItem(
                  title: item.title,
                  isActive: index == levelSelect,
                ),
              )))
          ?.values
          ?.toList();
    }
    return ListView(
      children: children != null ? children : [],
    );
  }

  tapMenuItem(int index, int menuIndex) {
    menuIndex == 0 ? typeSelect = index : levelSelect = index;
    setState(() {});
    _downMenuController.hide();
  }
}

class CardItem extends StatelessWidget {
  final BankCardModel cardInfo;
  final bool selected;

  final int index;

  final onTap;

  const CardItem(
      {Key key, this.cardInfo, this.selected = false, this.index, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil.instance.setHeight(15),
        right: ScreenUtil.instance.setHeight(15),
      ),
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: cardInfo.logo,
                    width: ScreenUtil.instance.setWidth(327),
                    height: ScreenUtil.instance.setWidth(208),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => new Loading(
                      width: ScreenUtil.instance.setWidth(327),
                      height: ScreenUtil.instance.setWidth(208),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil.instance.setWidth(25),
                  right: ScreenUtil.instance.setWidth(25),
                  child: Image.asset(
                    selected
                        ? "assets/images/kaxuanzhong.png"
                        : "assets/images/kaweixuan.png",
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
                    cardInfo.title,
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
    );
  }
}

class DropdownItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const DropdownItem({Key key, this.title, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: isActive ? SU.colorYellow : SU.color333,
              fontSize: SU.font16,
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
              height: 1,
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
