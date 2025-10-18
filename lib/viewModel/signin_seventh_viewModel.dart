import 'package:flutter/material.dart';

class SigninSeventhViewModel extends ChangeNotifier {
  int _selectedHeight = 150; // default height in cm
  final List<int> _heights = List.generate(101, (i) => 100 + i); // 100–200 cm

  int get selectedHeight => _selectedHeight;
  List<int> get heights => _heights;

  void setSelectedHeight(int height) {
    _selectedHeight = height;
    notifyListeners();
  }
}
