import 'package:card_xiaomei/model/bank_list_entity.dart';
import 'package:card_xiaomei/model/card_tyes_list_entity.dart';
import 'package:card_xiaomei/model/home_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BankListEntity") {
      return BankListEntity.fromJson(json) as T;
    } else if (T.toString() == "CardTyesListEntity") {
      return CardTyesListEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeModelEntity") {
      return HomeModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}