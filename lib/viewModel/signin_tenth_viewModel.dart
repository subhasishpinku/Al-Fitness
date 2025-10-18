import 'package:flutter/material.dart';

class SigninTenthViewModel extends ChangeNotifier {
  final List<int> _waistMeasurements = List.generate(50, (index) => 55 + index);
  int _selectedWaist = 60;

  List<int> get waistMeasurements => _waistMeasurements;
  int get selectedWaist => _selectedWaist;

  void setSelectedWaist(int newWaist) {
    _selectedWaist = newWaist;
    notifyListeners();
  }
}
