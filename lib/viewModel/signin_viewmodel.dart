import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninViewModel extends ChangeNotifier {
  final List<String> topics = [
    "Weight Loss Fat-Burning Diet & \n Exercise Plan ",
    "Weight Loss Ketogenic Diet & \n Exercise Plan",
    "Weight Loss Diabetic-Friendly Diet & \n Exercise Plan",
    "High-Protein Diet & Exercise Plan",
    "Muscle Gain Diet & Exercise Plan",
  ];
  final List<bool> _isVisible = [false, false, false, false, false];
  List<bool> get isVisible => _isVisible;
  SigninViewModel() {
    _animateButtonsSequentially();
  }

  /// Sequential animation for button appearance
  Future<void> _animateButtonsSequentially() async {
    for (int i = 0; i < topics.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _isVisible[i] = true;
      notifyListeners();
    }
  }

  /// Handle button click
  void onTopicSelected(BuildContext context, String topic) {
    debugPrint("Selected topic: $topic");
    Navigator.pushNamed(context, RouteNames.signinScreenSecond);
  }
}
