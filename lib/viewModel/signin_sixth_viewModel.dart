import 'package:flutter/material.dart';

class SigninSixthViewModel extends ChangeNotifier {
  int _selectedYear = DateTime.now().year - 25; // Default year
  final List<int> _years = List.generate(60, (i) => 1965 + i);

  int get selectedYear => _selectedYear;
  List<int> get years => _years;

  void setSelectedYear(int year) {
    _selectedYear = year;
    notifyListeners();
  }
}
