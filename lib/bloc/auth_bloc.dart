import 'package:flutter/material.dart';

class AuthBloc extends ChangeNotifier {
  bool isLoading = false;

  startLoading(){
    isLoading = true;
    notifyListeners();
  }
  stopLoading(){
    isLoading = false;
    notifyListeners();
  }
}