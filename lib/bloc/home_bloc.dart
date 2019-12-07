import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  bool isLoading = false;
  int currentIndex = 0;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
