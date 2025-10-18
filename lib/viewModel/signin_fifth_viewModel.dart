import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SigninFifthViewModel extends ChangeNotifier {
  final List<String> _topics = ["Male", "Female"];

  List<String> get topics => _topics;

  final List<bool> _isVisible = List.filled(5, false);
  List<bool> get isVisible => _isVisible;

  String? _selectedTopic;
  String? get selectedTopic => _selectedTopic;

  SigninFifthViewModel() {
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
    Navigator.pushNamed(context, RouteNames.signinScreenSixth);
  }
}
