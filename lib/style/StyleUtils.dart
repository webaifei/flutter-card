import 'package:flutter/material.dart';

/// 通用样式基础类
class SU {
  static double font12 = 12;
  static double font14 = 14;
  static double font16 = 16;
  static double font17 = 17;
  static double font19 = 19;
  static double font20 = 20;

  // colors
  static Color color333 = Color(0xff333333);
  static Color color666 = Color(0xff666666);
  static Color color999 = Color(0xff999999);
  static Color colorccc = Color(0xffcccccc);
  static Color colore6 = Color(0xffE6E6E6);
  static Color colorYellow = Color(0xffFFAB00);
  static Color colorWarning = Color(0xffff3f3f);



  static TextStyle title = TextStyle(color: color333, fontSize: font14);
  static TextStyle desc = TextStyle(color: color666, fontSize: font14);
  static TextStyle tip = TextStyle(color: colorccc, fontSize: font12);

  static Text getText(String text, [Color color, double fontSize, FontWeight fontWeight]) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}


