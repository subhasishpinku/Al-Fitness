import 'package:flutter/material.dart';

class SigninNinthViewModel extends ChangeNotifier {
  final List<int> _hipMeasurements = List.generate(50, (index) => 60 + index);
  int _selectedHip = 65;

  List<int> get hipMeasurements => _hipMeasurements;
  int get selectedHip => _selectedHip;

  void setSelectedHip(int newHip) {
    _selectedHip = newHip;
    notifyListeners();
  }
}
