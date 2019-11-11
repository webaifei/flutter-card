import 'package:card_xiaomei/style/StyleUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.onTap,
    this.text
  }) : super(key: key);

  final GestureTapCallback onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Material(
      color: SU.colorWarning,
      borderRadius: BorderRadius.circular(80),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: ScreenUtil.instance.setWidth(630),
          height: ScreenUtil.instance.setHeight(80),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: SU.font17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
