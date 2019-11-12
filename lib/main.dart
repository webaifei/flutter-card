import 'package:card_xiaomei/example/InheritedWidget.dart';
import 'package:card_xiaomei/model/home_model_entity.dart';
import 'package:flutter/material.dart';
import 'package:card_xiaomei/ui/page/Login.dart';
import 'package:card_xiaomei/ui/page/Home.dart';
import 'package:card_xiaomei/ui/page/SelectCard.dart';
import 'package:card_xiaomei/ui/page/AddCard.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<HomeModelEntity>(
      model: HomeModelEntity(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '卡小秘',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: HomePage(),
        routes: {},
      ),
    );
  }
}
