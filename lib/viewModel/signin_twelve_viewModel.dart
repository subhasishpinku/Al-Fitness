// signin_twelve_viewmodel.dart
import 'package:flutter/material.dart';

class SigninTwelveViewModel extends ChangeNotifier {
  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
