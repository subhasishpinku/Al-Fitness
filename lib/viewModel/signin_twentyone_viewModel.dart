import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninTwentyOneViewModel extends ChangeNotifier {
  final List<String> fruits = [
    'Banana',
    'Pear',
    'Guava',
    'Papaya',
    'Pineapple',
    'Peach/Plum',
    'Berries',
    'Figs',
    'Apple',
    'Lychees',
    'Watermelon',
    'Avocados',
  ];

  final List<String> selectedFruits = [];

  bool get canProceed =>
      selectedFruits.length >= 2 && selectedFruits.length <= 5;

  void toggleSelection(String fruit) {
    if (selectedFruits.contains(fruit)) {
      selectedFruits.remove(fruit);
    } else {
      if (selectedFruits.length >= 5) return;
      selectedFruits.add(fruit);
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
      // TODO: Replace next screen route here
      Navigator.pushNamed(context, RouteNames.signinScreenTwentyTwo);
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
