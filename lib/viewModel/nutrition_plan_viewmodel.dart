import 'package:aifitness/models/DietData.dart';
import 'package:aifitness/models/FoodItem.dart';
import 'package:aifitness/models/meal_model.dart';
import 'package:aifitness/repository/DietRepository.dart';
import 'package:flutter/foundation.dart';

class NutritionPlanViewModel extends ChangeNotifier {
  final repo = DietRepository();

  FoodItem? diet;
  bool loading = false;
  final DietRepository _repo = DietRepository();

  bool isLoading = false;
  Map<String, List<FoodItem>> meals = {};
  DietData? dietData;
  String? errorMessage;

  // List<MealSection> get mealSections => [
  //   MealSection(
  //     title: "Pre-Workout Meal (Eat 60–90 mins before workout)",
  //     iconPath: "assets/images/preworkout.png",
  //     totalKcal: "420 kcal",
  //     items: [
  //       MealItem(
  //         name: "¾ Cup cooked quinoa (90 g)",
  //         image: "assets/images/quinoa.jpg",
  //         carbs: "20g",
  //         protein: "4g",
  //         fats: "2g",
  //       ),
  //       MealItem(
  //         name: "1 Piece of Avocado",
  //         image: "assets/images/avocado.jpeg",
  //         carbs: "4g",
  //         protein: "1g",
  //         fats: "22g",
  //       ),
  //     ],
  //   ),
  //   MealSection(
  //     title: "Post-Workout Meal (Eat within 30 mins after workout)",
  //     iconPath: "assets/images/sweet_potato1.png",
  //     totalKcal: "350 kcal",
  //     items: [
  //       MealItem(
  //         name: "1 Banana + 1 Scoop Whey Protein",
  //         image: "assets/images/sweet_potato.jpeg",
  //         carbs: "25g",
  //         protein: "24g",
  //         fats: "2g",
  //       ),
  //     ],
  //   ),
  // ];
  Future<void> getDiet({
    required int week,
    required int userId,
    required String dayType,
    required String day,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _repo.getDietPlan(
        week: week,
        userId: userId,
        dayType: dayType,
        day: day,
      );

      if (response.success) {
        dietData = response.data;
        // meals = response.data;
        meals = {
          "breakfast": response.data!.breakfast!,
          "lunch": response.data!.lunch!,
          "dinner": response.data!.dinner!,
          "pre_workout": response.data!.preWorkout ?? [],
          "post_workout": response.data!.postWorkout ?? [],
          "snacks": response.data!.snacks ?? [],
        };

        print("Fetched Meals => $meals");
        print("errorFood $dietData");
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      print("errorFood $e");
    }

    isLoading = false;
    notifyListeners();
  }

  List<FoodItem> get breakfast => meals["breakfast"] ?? [];
  List<FoodItem> get lunch => meals["lunch"] ?? [];
  List<FoodItem> get dinner => meals["dinner"] ?? [];
  List<FoodItem> get snacks => meals["snacks"] ?? [];
  List<FoodItem> get postWorkout => meals["post_workout"] ?? [];
  List<FoodItem> get preWorkout => meals["pre_workout"] ?? [];
}
