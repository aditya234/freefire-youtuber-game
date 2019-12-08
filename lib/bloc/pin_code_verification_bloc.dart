import 'package:flutter/material.dart';

class PinCodeVerificationBloc extends ChangeNotifier {
  bool isLoading = false;
  String pinCode = "";
  bool hasError=false;

  startLoading(){
    isLoading = true;
    notifyListeners();
  }
  stopLoading(){
    isLoading = false;
    notifyListeners();
  }

  setHasError(bool status){
    hasError = status;
    notifyListeners();
  }

  setNewPinValue(String newPin){
    pinCode = newPin;
    notifyListeners();
  }
}