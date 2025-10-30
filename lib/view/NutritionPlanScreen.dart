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

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const SigninFourthAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nutrition Plan - Day $day",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Follow pre- and post-workout meals\nbased on your workout start time.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              ...viewModel.mealSections.map((section) => _buildMealSection(section)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealSection(MealSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: section.items.map((item) => _buildMealItem(item)).toList(),
        ),
        const SizedBox(height: 6),
        Text(
          "Total: ${section.totalKcal}",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildMealItem(MealItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              item.image,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Carbs: ${item.carbs} | Protein: ${item.protein} | Fats: ${item.fats}",
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
