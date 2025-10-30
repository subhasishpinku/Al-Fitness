import 'package:aifitness/models/meal_model.dart';
import 'package:aifitness/res/widgets/signin_fourth_appBar.dart';
import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/viewModel/nutrition_plan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NutritionPlanScreen extends StatelessWidget {
  final int day;
  const NutritionPlanScreen({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NutritionPlanViewModel>(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninFourthAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  "Nutrition Plan - Day $day",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Follow pre- and post-workout meals\nbased on your workout start time.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),

                // Render all meal sections dynamically
                ...viewModel.mealSections.map(
                  (section) => _buildMealSection(section),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMealSection(MealSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (section.iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 2),
                child: Image.asset(
                  section.iconPath!,
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),
            Expanded(
              child: Text(
                section.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // List of meal items
        Column(
          children: section.items.map((item) => _buildMealItem(item)).toList(),
        ),

        // Nutrition Summary
        Padding(
          padding: const EdgeInsets.only(left: 6, top: 4),
          child: Row(
            children: [
              const Icon(Icons.bar_chart, size: 16, color: Colors.blueAccent),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  "${section.totalKcal} | Protein: 9g | Carbs: 44g | Fats: 1.9g | Fiber: 4.6g",
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Divider(color: Colors.black12, height: 1),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildMealItem(MealItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              item.image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),

          // Text Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Carbs: ${item.carbs}",
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  Text(
                    "Protein: ${item.protein}",
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  Text(
                    "Fat: ${item.fats}",
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
