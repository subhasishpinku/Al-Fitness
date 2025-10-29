import 'package:flutter/material.dart';

class ExtraFoodIntakeViewModel extends ChangeNotifier {
  final TextEditingController intakeController = TextEditingController();
  final List<String> _intakeHistory = [];

  List<String> get intakeHistory => _intakeHistory;

  void submitIntake() {
    final text = intakeController.text.trim();
    if (text.isNotEmpty) {
      _intakeHistory.add(text);
      intakeController.clear();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    intakeController.dispose();
    super.dispose();
  }
}
