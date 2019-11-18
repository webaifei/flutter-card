import 'package:card_xiaomei/model/card_tyes_list_entity.dart';
import 'package:card_xiaomei/model/home_model_entity.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
//  locator.registerLazySingleton<WebService>(() => WebService());
//  locator.registerLazySingleton<UserService>(() => UserService());

  // Register ScopedModels
  locator.registerSingleton<HomeModelEntity>(HomeModelEntity());
  locator.registerFactory<CardTyesListEntity>(() => CardTyesListEntity());
}
