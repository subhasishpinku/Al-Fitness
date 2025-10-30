import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_fourth_appBar.dart';
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
            textDirection: TextDirection.ltr, //  All text right-aligned
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: const SigninFourthAppBar(),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Tap on a day to view your\nnutrition plan",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      /// Workout Days Section
                      Align(
                        alignment: Alignment.topRight,
                        child: _buildSection(
                          title: "Nutrition Plan for Workout Days",
                          days: vm.workoutDays,
                          onDayPressed: (day) => vm.openDayPlan(context, day),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Non-Workout Days Section
                      Align(
                        alignment: Alignment.topRight,
                        child: _buildSection(
                          title: "Nutrition Plan for Non-Workout Days",
                          days: vm.nonWorkoutDays,
                          onDayPressed: (day) => vm.openDayPlan(context, day),
                        ),
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
    return Consumer<ViewPlanViewModel>(
      builder: (context, vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),

            /// Animated day buttons (fade + slide from right)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(days.length, (index) {
                // Get index offset for animation visibility
                final globalIndex =
                    index +
                    (title.contains('Workout Days')
                        ? 0
                        : vm.workoutDays.length);

                final visible = vm.dayVisible.length > globalIndex
                    ? vm.dayVisible[globalIndex]
                    : false;

                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: visible ? 1 : 0,
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 400),
                    offset: visible ? Offset.zero : const Offset(0.3, 0),
                    curve: Curves.easeOut,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: 90,
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
                          onPressed: () => onDayPressed(days[index]),
                          child: Text(
                            "Day ${days[index]}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
