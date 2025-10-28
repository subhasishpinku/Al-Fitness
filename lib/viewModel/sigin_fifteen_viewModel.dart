import 'package:flutter/material.dart';
import 'package:aifitness/utils/routes/routes_names.dart';

class SigninFifteenViewModel extends ChangeNotifier {
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  final List<String> options = [
    "Gym",
    "Home (Dumbbell, Barbell, Band)",
    "Home (Bodyweight)",
  ];

  final List<bool> _isVisible = [false, false, false];
  List<bool> get isVisible => _isVisible;

  SigninFifteenViewModel() {
    _animateButtonsSequentially();
  }

  /// Animate the appearance of buttons one by one
  Future<void> _animateButtonsSequentially() async {
    for (int i = 0; i < options.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _isVisible[i] = true;
      notifyListeners();
    }
  }

  /// Handle option selection
  void selectOption(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// Handle navigation on selection
  void onNextPressed(BuildContext context) {
    if (_selectedIndex != -1) {
      Navigator.pushNamed(context, RouteNames.signinScreenSixteen);
    }
  }
}
