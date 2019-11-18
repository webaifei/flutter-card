import 'package:dio/dio.dart';

class API {
  static BaseOptions baseOptions = new BaseOptions(
      receiveTimeout: 10 * 1000,
//      baseUrl: "https://raw.githubusercontent.com",
      baseUrl: "http://192.168.1.8:8080",
      headers: {
        "token": "" // 如何处理
      });
  static Dio _instance = new Dio(baseOptions);
  static Dio getInstance() {
    if (_instance == null) {
      return new Dio(baseOptions);
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
