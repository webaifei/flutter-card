import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class API {
  static BaseOptions baseOptions = new BaseOptions(
      receiveTimeout: 10 * 1000,
      baseUrl: "https://gitlab.com/webaifei/flutter-card/raw/master",
      headers: {
        "token": "" // 如何处理
      });
  static Dio _instance;
  static Dio getInstance() {
    if (_instance == null) {
      _instance = new Dio(baseOptions);
      // TODO: 根据环境 添加logger
      _instance.interceptors
        ..add(LogInterceptor(
            requestBody: true,
            responseBody: true,
            requestHeader: false,
            responseHeader: false))
        ..add(InterceptorsWrapper(onResponse: (Response response) async {
          return jsonDecode(response.toString());
        }));
    }
    return _instance;
  }

  // 添加卡片
  static addCard(data) {
    return getInstance().get("/lib/json/addCard.json");
  }

  // 获取银行列表
  // TODO: 本地缓存结果 优先从本地存储中获取
  static getBankList() {
    return getInstance().get("/lib/json/bankList.json");
  }

  static getAllCardList() {
    return getInstance().get("/lib/json/allCardList.json");
  }
}
