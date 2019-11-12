import 'dart:convert';
import 'dart:core';
import 'dart:io';

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
  static HomeModelEntity of(BuildContext context) =>
      ScopedModel.of<HomeModelEntity>(context);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cardList != null) {
      data['list'] = this.cardList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // 封装CRUD 操作
  fetchCardList() async {
    // fetch api
    HttpClient httpClient = new HttpClient();
    // 忽略https证书检测
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      return true;
    };
    Uri url = Uri(
        scheme: "https",
        host: "easy-mock.com",
        path: "/mock/5dc8c44a65dec35bd6e86100/kxm/getCardList");

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
}


