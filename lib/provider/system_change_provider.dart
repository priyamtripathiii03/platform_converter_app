import 'package:flutter/cupertino.dart';

class SystemChange extends ChangeNotifier {
  bool isIos = false;

  void changeSystem(value) {
    isIos = value;
    notifyListeners();
  }
}