import 'package:flutter/foundation.dart';

class DropDownMenuController extends ChangeNotifier {
  int menuIndex = 0;
  bool isShow = false;

  void show(int index) {
    isShow = true;
    menuIndex = index;
    notifyListeners();
  }

  void hide() {
    isShow = false;
    notifyListeners();
  }
}
