import 'package:flutter/cupertino.dart';

class ThemeChange extends ChangeNotifier {
  bool isLight = false;
  bool isContainer = false;

  void changeTheme(value) {
    isLight = value;
    notifyListeners();
  }
  void container(value){
    isContainer = value;
    notifyListeners();
  }
}