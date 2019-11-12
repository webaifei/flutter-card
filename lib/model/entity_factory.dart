import 'package:card_xiaomei/model/home_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeModelEntity") {
      return HomeModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}