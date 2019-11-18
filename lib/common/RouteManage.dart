import 'package:card_xiaomei/ui/page/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String splash = 'splash';
  static const String login = 'login';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => LoginPage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
