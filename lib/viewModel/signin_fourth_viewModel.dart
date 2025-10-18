import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninFourthViewModel extends ChangeNotifier {
  final List<String> _topics = [
    "Sedentary: Little to no \n physical activity.",
    "Lightly Active: Light exercise or \n physical activity 1–3 days a week.",
    "Moderately Active: Engaging in \n  moderate exercise or physical \n activity 3–5 days a week.",
    "Very Active: Hard exercise or \n physical activity 6–7 days a week.",
    "Super Active: Very intense exercise \n or physical activity, often multiple \n  times per day, or for those with \n physically demanding jobs or \n training programs.",
  ];

  List<String> get topics => _topics;

  final List<bool> _isVisible = List.filled(5, false);
  List<bool> get isVisible => _isVisible;

  String? _selectedTopic;
  String? get selectedTopic => _selectedTopic;

  SigninFourthViewModel() {
    _animateButtonsSequentially();
  }

  Future<void> _animateButtonsSequentially() async {
    for (int i = 0; i < _topics.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _isVisible[i] = true;
      notifyListeners();
    }
  }

  void onTopicSelected(BuildContext context, String topic) {
    _selectedTopic = topic;
    notifyListeners();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Selected: $topic")));
    Navigator.pushNamed(context, RouteNames.signinScreenFifth);
  }
}
