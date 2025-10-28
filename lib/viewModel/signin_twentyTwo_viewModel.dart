import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninTwentyTwoViewModel extends ChangeNotifier {
  final List<String> nuts = [
    'Peanut Butter',
    'Pistachios',
    'Pine Nuts',
    'Walnuts',
    'Cashews',
    'Brazil Nuts',
    'Macadamia Nuts',
    'Hazelnuts',
  ];

  final List<String> selectedNuts = [];

  bool get canProceed => selectedNuts.length >= 2 && selectedNuts.length <= 5;

  void toggleSelection(String nut) {
    if (selectedNuts.contains(nut)) {
      selectedNuts.remove(nut);
    } else {
      if (selectedNuts.length >= 5) return;
      selectedNuts.add(nut);
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
      // TODO: Update with your next screen route
      Navigator.pushNamed(context, RouteNames.signinScreenTwentyThree);
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
