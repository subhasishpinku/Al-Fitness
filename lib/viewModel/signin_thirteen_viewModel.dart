import 'package:flutter/material.dart';

class SigninThirteenViewModel extends ChangeNotifier {
  bool _isLoading = true;
  Map<String, String> _fatLossData = {};

  bool get isLoading => _isLoading;
  Map<String, String> get fatLossData => _fatLossData;

  // Simulate API call
  Future<void> fetchFatLossData() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // simulate API call
    _fatLossData = {
      'BMI': '24.5',
      'CurrentWeight': '75kg',
      'Goal': '70kg',
      'TotalLoss': '5kg',
      'FirstMilestone': '72kg',
      'NewIntake': '1800 kcal',
      'FinalGoal': '70kg',
    };

    _isLoading = false;
    notifyListeners();
  }
}
