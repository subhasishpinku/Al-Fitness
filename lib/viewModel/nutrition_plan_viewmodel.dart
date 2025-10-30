import 'package:aifitness/models/meal_model.dart';
import 'package:flutter/foundation.dart';

class NutritionPlanViewModel extends ChangeNotifier {
  List<MealSection> get mealSections => [
    MealSection(
      title: "Pre-Workout Meal (Eat 60–90 mins before workout)",
      iconPath: "assets/images/preworkout.png",
      totalKcal: "420 kcal",
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
      title: "Post-Workout Meal (Eat within 30 mins after workout)",
      iconPath: "assets/images/sweet_potato.jpeg",
      totalKcal: "350 kcal",
      items: [
        MealItem(
          name: "1 Banana + 1 Scoop Whey Protein",
          image: "assets/images/sweet_potato.jpeg",
          carbs: "25g",
          protein: "24g",
          fats: "2g",
        ),
      ],
    ),
  ];
}
