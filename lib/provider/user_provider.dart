import 'package:flutter/material.dart';
class UserProvider extends ChangeNotifier{
  bool _isObscured = true; 
  bool get isObscured => _isObscured;
   bool _isObscuredConfirm = true; 
  bool get isConfirmObscure => _isObscuredConfirm;
  void showPassword() {
    _isObscured = !_isObscured; 
    notifyListeners(); 
  }
  void showConfirmPass() {
    _isObscuredConfirm = !_isObscuredConfirm; 
    notifyListeners(); 
  }



  
}