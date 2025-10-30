import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:aifitness/viewModel/view_plan_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPlanScreen extends StatelessWidget {
  const ViewPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewPlanViewModel(),
      child: Consumer<ViewPlanViewModel>(
        builder: (context, vm, _) {
          return Directionality(
            textDirection: TextDirection.rtl, // 👈 Right aligned layout
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: const SigninSecondAppBar(),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Tap on a day to view your\nnutrition plan",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 25),

                      /// Workout Days Section
                      _buildSection(
                        title: "Nutrition Plan for Workout Days",
                        days: vm.workoutDays,
                        onDayPressed: (day) => vm.openDayPlan(context, day),
                      ),
                      const SizedBox(height: 20),

                      /// Non-Workout Days Section
                      _buildSection(
                        title: "Nutrition Plan for Non-Workout Days",
                        days: vm.nonWorkoutDays,
                        onDayPressed: (day) => vm.openDayPlan(context, day),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<int> days,
    required Function(int) onDayPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: days.map((day) {
            return SizedBox(
              width: 80,
              height: 38,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                onPressed: () => onDayPressed(day),
                child: Text(
                  "Day $day",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
