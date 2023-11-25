import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  int selectedIndex = 0;

  increment() {
    counter++;
    notifyListeners();
  }

  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}