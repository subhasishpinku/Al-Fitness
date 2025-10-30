import 'package:aifitness/models/meal_model.dart';
import 'package:flutter/material.dart';

class NutritionPlanViewModel extends ChangeNotifier {
  final List<MealSection> _mealSections = [
    MealSection(
      title: "Pre-Workout Meal (Eat 60–90 mins before workout)",
      totalKcal: "351 Kcal",
      items: [
        MealItem(
          name: "¾ Cup cooked quinoa (90 g)",
          image: "assets/images/quinoa.jpg",
          carbs: "20g",
          protein: "4g",
          fats: "2g",
        ),
        MealItem(
          name: "1 Piece of Avocado",
          image: "assets/images/avocado.jpeg",
          carbs: "4g",
          protein: "1g",
          fats: "22g",
        ),
      ],
    ),
    MealSection(
      title: "Post-Workout Meal",
      totalKcal: "566 Kcal",
      items: [
        MealItem(
          name: "⅓ Cup of Sweet Potatoes",
          image: "assets/images/sweet_potato.jpeg",
          carbs: "23g",
          protein: "2g",
          fats: "0g",
        ),
        MealItem(
          name: "2 Pieces of Avocado",
          image: "assets/images/avocado.jpeg",
          carbs: "4g",
          protein: "1g",
          fats: "22g",
        ),
      ],
    ),
  ];

  List<MealSection> get mealSections => _mealSections;
}
