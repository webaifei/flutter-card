import 'package:card_xiaomei/example/InheritedWidget.dart';
import 'package:card_xiaomei/model/card_tyes_list_entity.dart';
import 'package:card_xiaomei/model/home_model_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_xiaomei/ui/page/Login.dart';
import 'package:card_xiaomei/ui/page/Home.dart';
import 'package:card_xiaomei/ui/page/SelectCard.dart';
import 'package:card_xiaomei/ui/page/AddCard.dart';
import 'package:flutter/rendering.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scoped_model/scoped_model.dart';

import 'common/RouteManage.dart';
import 'common/setupLocator.dart';

void main() {
//  debugPaintSizeEnabled = true;
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '卡小秘',
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          home: HomePage(),
//            home: InheritedWidgetDemo(),
          routes: {"selectCard": (context) => SelectCardPage()},
          onGenerateRoute: Router.generateRoute),
    );
  }
}
