import 'package:flutter/material.dart';

class ViewPlanViewModel extends ChangeNotifier {
  /// Example data
  final List<int> workoutDays = [1];
  final List<int> nonWorkoutDays = [1, 2, 3, 4, 5, 6];

  /// Open specific day plan
  void openDayPlan(BuildContext context, int day) {
    // You can navigate to another screen or show a dialog here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening Nutrition Plan for Day $day')),
    );
  }
}
