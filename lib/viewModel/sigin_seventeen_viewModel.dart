import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninSeventeenViewModel extends ChangeNotifier {
  final List<String> options = [
    "Oats",
    "Brown Rice",
    "Barley",
    "Whole Wheat Bread",
    "Quinoa",
    "Rye Bread",
    "Whole Grain Bread",
    "Millets",
    "Buckwheat",
    "Amaranth",
    "Farro",
    "Spelt",
  ];

  final List<String> _selectedItems = [];
  List<String> get selectedItems => _selectedItems;

  bool get canProceed => _selectedItems.length >= 2 && _selectedItems.length <= 5;

  /// Toggle item selection
  void toggleSelection(String item) {
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      if (_selectedItems.length < 5) {
        _selectedItems.add(item);
      }
    }
    notifyListeners();
  }

  /// Handle navigation
  void onNextPressed(BuildContext context) {
    if (canProceed) {
      // Navigate to next screen
      Navigator.pushNamed(context, RouteNames.signinScreenEighteen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select between 2 and 5 items."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
