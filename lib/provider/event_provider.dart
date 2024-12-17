import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  //=======================Event for Bottom Naviagion Bar ===================
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
