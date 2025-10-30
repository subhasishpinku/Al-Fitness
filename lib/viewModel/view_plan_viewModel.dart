import 'package:aifitness/view/NutritionPlanScreen.dart';
import 'package:flutter/material.dart';

class ViewPlanViewModel extends ChangeNotifier {
  final List<int> workoutDays = [1];
  final List<int> nonWorkoutDays = [1, 2, 3, 4, 5, 6];

  /// Animation visibility states
  final List<bool> dayVisible = [];

  ViewPlanViewModel() {
    _initAnimations();
  }

  void _initAnimations() async {
    final allDays = [...workoutDays, ...nonWorkoutDays];
    dayVisible.clear();
    dayVisible.addAll(List.generate(allDays.length, (_) => false));

    // Animate each day button one by one
    for (int i = 0; i < allDays.length; i++) {
      await Future.delayed(Duration(milliseconds: 150 * i));
      dayVisible[i] = true;
      notifyListeners();
    }
  }

  /// Open specific day plan
  void openDayPlan(BuildContext context, int day) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NutritionPlanScreen(day: day)),
    );
  }
}
