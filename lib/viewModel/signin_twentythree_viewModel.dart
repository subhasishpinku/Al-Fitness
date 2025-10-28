import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninTwentyThreeViewModel extends ChangeNotifier {
  final List<String> fatSources = [
    "Olive Oil",
    "Chia Seeds",
    "Fresh salmon fillet",
    "Avocados",
    "Macadamia Nuts",
    "Ghee (Clarified Butter)",
    "Sesame Oil",
    "Coconut Oil",
    "Flaxseeds",
    "Walnut Oil",
  ];

  final List<String> selectedSources = [];

  bool get canProceed => selectedSources.length >= 2 && selectedSources.length <= 5;

  void toggleSelection(String item) {
    if (selectedSources.contains(item)) {
      selectedSources.remove(item);
    } else {
      if (selectedSources.length >= 5) return;
      selectedSources.add(item);
    }
    notifyListeners();
  }

  void onNextPressed(BuildContext context) {
    if (!canProceed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select between 2 and 5 items."),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Proceeding to next step..."),
        duration: Duration(seconds: 1),
      ),
    );

    // Example navigation:
    Navigator.pushNamed(context, RouteNames.signinScreenTwentyFour);
  }
}
