import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:card_xiaomei/common/API.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:card_xiaomei/model/BankCardModel.dart';

/// 简单的操作
/// 1. UI -> callback -> fetch -> response[json]-> setSate
/// 2. UI -> callback -> service -> network(fetch + response) -> viewModel(entity+CRUD)
class HomeModelEntity extends Model {
  List<BankCardModel> cardList = [];
  final String title = "卡小秘";

  HomeModelEntity({this.cardList});

  HomeModelEntity.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      cardList = new List<BankCardModel>();
      (json['list'] as List).forEach((v) {
        cardList.add(new BankCardModel.fromJson(v));
      });
    }
  }

  initCardListFromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      this.cardList = new List<BankCardModel>();
      (json['list'] as List).forEach((v) {
        this.cardList.add(new BankCardModel.fromJson(v));
      });
    }
  }

  static HomeModelEntity of(BuildContext context) =>
      ScopedModel.of<HomeModelEntity>(context);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cardList != null) {
      data['list'] = this.cardList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  addCard(BankCardModel cardItem) {
    cardList.add(cardItem);
    notifyListeners();
  }

  // 封装CRUD 操作
  fetchCardListOld() async {
    // fetch api
    HttpClient httpClient = new HttpClient();
    // 忽略https证书检测
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      return true;
    };
    Uri url = Uri(
        scheme: "https",
        host: "raw.githubusercontent.com",
        path: "/webaifei/flutter-card/master/lib/json/cardList.json");

    HttpClientRequest request = await httpClient.getUrl(url);
    // 添加自定义请求头
    request.headers.add("token", "test");
    HttpClientResponse response = await request.close();

    String responseBody = await response.transform(utf8.decoder).join();

    httpClient.close();
    print("aaa");
    print(responseBody);
    // 设置cardList
    // notify rerender
  }

  fetchCardList() async {
    try {
      Response res = await API.getInstance().get("/lib/json/cardList.json");
      Map<String, dynamic> data = res.data["data"];
      initCardListFromJson(data);
      notifyListeners();
      return data;
    } catch (err) {
      print(err);
      //网络错误
      //业务逻辑错误
      //toast
    }
  }
}
