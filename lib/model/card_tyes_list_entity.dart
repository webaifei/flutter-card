import 'package:card_xiaomei/common/API.dart';
import 'package:card_xiaomei/model/BankCardModel.dart';
import 'package:dio/dio.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

/// 卡片等级 类型
class CardTyesListEntity extends Model {
  List<CardTyesListType> types;
  List<CardTyesListLevel> levels;

  List<BankCardModel> list;

  int _menuIndex = 0;
  int get menuIndex => _menuIndex;
  setMenu(int index) {
    _menuIndex = index;
    notifyListeners();
  }

  static CardTyesListEntity of(BuildContext context) =>
      ScopedModel.of<CardTyesListEntity>(context);

  CardTyesListEntity({this.types, this.levels});

  CardTyesListEntity.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = new List<CardTyesListType>();
      (json['types'] as List).forEach((v) {
        types.add(new CardTyesListType.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = new List<CardTyesListLevel>();
      (json['levels'] as List).forEach((v) {
        levels.add(new CardTyesListLevel.fromJson(v));
      });
    }
  }

  fetchCardTypes() async {
    try {
      Response res = await API.getInstance().get("/lib/json/cardTypes.json");
      Map<String, dynamic> data = res.data["data"];
      initCardTypesFromJson(data);
      notifyListeners();
      return data;
    } catch (err) {
      print(err);
      //网络错误
      //业务逻辑错误
      //toast
    }
  }

  fetchAllCardList() async {
    try {
      Response res = await API.getAllCardList();
      Map<String, dynamic> data = res.data["data"];
      listFromJson(data);
      notifyListeners();
      return data;
    } catch (err) {
      print(err);
      //网络错误
      //业务逻辑错误
      //toast
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    if (this.levels != null) {
      data['levels'] = this.levels.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void listFromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<BankCardModel>();
      (json['list'] as List).forEach((v) {
        list.add(new BankCardModel.fromJson(v));
      });
    }
  }

  // 初始化卡片等级 类型数据
  void initCardTypesFromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = new List<CardTyesListType>();
      (json['types'] as List).forEach((v) {
        types.add(new CardTyesListType.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = new List<CardTyesListLevel>();
      (json['levels'] as List).forEach((v) {
        levels.add(new CardTyesListLevel.fromJson(v));
      });
    }
  }
}

class CardTyesListType {
  String id;
  String title;

  CardTyesListType({this.id, this.title});

  CardTyesListType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class CardTyesListLevel {
  String id;
  String title;

  CardTyesListLevel({this.id, this.title});

  CardTyesListLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
