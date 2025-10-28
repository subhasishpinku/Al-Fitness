import 'package:flutter/material.dart';

class DashboardBodyViewModel extends ChangeNotifier {
  double _currentWeight = 60.0;
  double _targetWeight = 59.8;
  double _dailyCalories = 1392.5;

  double get currentWeight => _currentWeight;
  double get targetWeight => _targetWeight;
  double get dailyCalories => _dailyCalories;

  /// Example data for cards
  final List<double> _weightData = [64.0, 61.0, 63.6, 62.6];
  List<double> get weightData => _weightData;

  /// Example update methods
  void updateWeight(double value) {
    _currentWeight = value;
    notifyListeners();
  }

  void updateTargetWeight(double value) {
    _targetWeight = value;
    notifyListeners();
  }

  void updateDailyCalories(double value) {
    _dailyCalories = value;
    notifyListeners();
  }
}
