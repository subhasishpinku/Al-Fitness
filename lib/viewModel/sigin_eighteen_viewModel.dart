import 'package:flutter/material.dart';

class SigninEighteenViewModel extends ChangeNotifier {
  final List<String> options = [
    "Oats",
    "Sweet Potatoes",
    "Brown Rice",
    "Whole Wheat Bread",
    "Quinoa",
    "Whole grain Pasta",
    "Whole lentils",
    "Rye Bread",
    "Potatoes",
    "Millets",
    "Soba Noodles\n(Buckwheat)",
  ];

  final List<String> _selectedItems = [];
  List<String> get selectedItems => _selectedItems;

  bool get canProceed => _selectedItems.length >= 2 && _selectedItems.length <= 5;

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

  void onNextPressed(BuildContext context) {
    if (canProceed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Proceeding to next step..."),
          duration: Duration(seconds: 1),
        ),
      );
      // TODO: Navigate to the next screen here
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
