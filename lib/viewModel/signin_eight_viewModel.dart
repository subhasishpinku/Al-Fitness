import 'package:flutter/material.dart';

class SigninEightViewModel extends ChangeNotifier {
  // Generate weight list (40.0 → 120.0 kg with 0.1 step)
  final List<double> weights =
      List.generate(801, (index) => 40.0 + index * 0.1);

  double _selectedWeight = 60.0; // Default weight
  double get selectedWeight => _selectedWeight;

  void setSelectedWeight(double value) {
    _selectedWeight = value;
    notifyListeners();
  }
}
