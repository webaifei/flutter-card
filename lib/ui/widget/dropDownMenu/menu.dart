import 'package:card_xiaomei/model/card_tyes_list_entity.dart';
import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';

import 'DropDownMenuController.dart';

/// 下拉选择菜单的头部
/// 1. 当前激活tab：
/// 2. 对应的下拉展开组件
///
class DropMenu extends StatefulWidget {
  final DropDownMenuController controller;
  final CardTyesListEntity cardTyesListEntity;

  const DropMenu({
    Key key,
    this.controller,
    this.cardTyesListEntity,
  }) : super(key: key);

  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  bool isOpen = false;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(tabClickHandler);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Container(
      height: ScreenUtil.instance.setWidth(100),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: SU.colore6,
          ),
        ),
      ),
      child: ScopedModelDescendant<CardTyesListEntity>(
        builder: (context, child, model) => Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _togglePanel(0, model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "卡系列",
                      style: TextStyle(
                        color: activeIndex == 0 ? SU.colorYellow : SU.color666,
                        fontSize: SU.font16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(24)),
                      child: Icon(
                        (activeIndex == 0 && isOpen)
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: ScreenUtil.instance.setWidth(28),
                        color: activeIndex == 0 ? SU.colorYellow : SU.color666,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _togglePanel(1, model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "卡等级",
                      style: TextStyle(
                        color: activeIndex == 1 ? SU.colorYellow : SU.color333,
                        fontSize: SU.font16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(24)),
                      child: Icon(
                        (activeIndex == 1 && isOpen)
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: ScreenUtil.instance.setWidth(28),
                        color: activeIndex == 1 ? SU.colorYellow : SU.color666,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tabClickHandler() {
    setState(() {
      isOpen = widget.controller.isShow;
      activeIndex = widget.controller.menuIndex;
    });
    widget.cardTyesListEntity.setMenu(widget.controller.menuIndex);
  }

  void _togglePanel(int i, CardTyesListEntity model) {
    model.setMenu(i);
    if (i == activeIndex) {
      isOpen ? widget.controller.hide() : widget.controller.show(i);
    } else {
      if (isOpen) {
        widget.controller.hide();
        Future.delayed(new Duration(milliseconds: 300)).then((value) {
          widget.controller.show(activeIndex == 1 ? 0 : 1);
        });
      } else {
        widget.controller.show(activeIndex == 1 ? 0 : 1);
      }
    }
  }
}
