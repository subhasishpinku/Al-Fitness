import 'package:flutter/material.dart';
import 'package:aifitness/utils/routes/routes_names.dart';

class SigninFourteenViewModel extends ChangeNotifier {
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  final List<String> options = [
    "1 Day / Week (6 days rest)",
    "3 Days / Week (Good balance)",
    "6 Days / Week (Only 1 rest day)",
  ];

  final List<bool> _isVisible = [false, false, false];
  List<bool> get isVisible => _isVisible;

  SigninFourteenViewModel() {
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

  /// Handle option selection
  void selectOption(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// Navigate to the next screen
  void onNextPressed(BuildContext context) {
    if (_selectedIndex != -1) {
      Navigator.pushNamed(context, RouteNames.signinScreenFifteen);
    }
  }
}
