import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninSecondViewModel extends ChangeNotifier {
  final List<String> _topics = [
    "Strength Training",
    "Cardio Training",
    "Strength & Cardio Training",
  ];

  List<String> get topics => _topics;

  // For animation visibility
  final List<bool> _isVisible = [false, false, false];
  List<bool> get isVisible => _isVisible;

  String? _selectedTopic;
  String? get selectedTopic => _selectedTopic;

  SigninSecondViewModel() {
    _animateButtonsSequentially();
  }

  /// Sequential animation for button appearance
  Future<void> _animateButtonsSequentially() async {
    for (int i = 0; i < _topics.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _isVisible[i] = true;
      notifyListeners();
    }
  }

  /// Handle topic selection
  void onTopicSelected(BuildContext context, String topic) {
    _selectedTopic = topic;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Selected: $topic")),
    );

    // Example: Navigate to next screen or perform logic
    Navigator.pushNamed(context, RouteNames.signinScreenThird);
  }
}
