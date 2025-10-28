import 'package:flutter/material.dart';
import 'package:aifitness/utils/routes/routes_names.dart';

class SigninSixteenViewModel extends ChangeNotifier {
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  final List<String> options = [
    "Omnivore (Eats plants and animals)",
    "Vegetarian (Includes egg and dairy)",
    "Vegan (No animal products)",
  ];

  final List<bool> _isVisible = [false, false, false];
  List<bool> get isVisible => _isVisible;

  SigninSixteenViewModel() {
    _animateButtonsSequentially();
  }

  /// Animate button appearance one by one
  Future<void> _animateButtonsSequentially() async {
    for (int i = 0; i < options.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _isVisible[i] = true;
      notifyListeners();
    }
  }

  /// Handle selection
  void selectOption(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// Navigate to next screen
  void onNextPressed(BuildContext context) {
    if (_selectedIndex != -1) {
      // Replace with your next route
      Navigator.pushNamed(context, RouteNames.signinScreenSeventeen);
    }
  }
}
