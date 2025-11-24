import 'package:aifitness/models/FoodItem.dart';
import 'package:aifitness/res/widgets/signin_fourth_appBar.dart';
import 'package:aifitness/utils/app_colors.dart';
import 'package:aifitness/viewModel/nutrition_plan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NutritionPlanScreen extends StatefulWidget {
  final int day;
  final String dayType;

  const NutritionPlanScreen({
    super.key,
    required this.day,
    required this.dayType,
  });

  @override
  State<NutritionPlanScreen> createState() => _NutritionPlanScreenState();
}

class _NutritionPlanScreenState extends State<NutritionPlanScreen> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("user_id") ?? 0;

    Future.microtask(() {
      Provider.of<NutritionPlanViewModel>(context, listen: false).getDiet(
        week: 2,
        userId: userId,
        dayType: widget.dayType,
        day: widget.day.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninFourthAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<NutritionPlanViewModel>(
            builder: (context, vm, child) {
              if (vm.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (vm.errorMessage != null) {
                return Center(
                  child: Text(
                    vm.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nutrition Plan - Day ${widget.day}",
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

                    /// PreWorkout
                    MealSectionWidget(
                      title: "Pre-Workout Meal (Eat 60–90 mins before workout)",
                      items: vm.preWorkout,
                    ),

                    /// PostWorkout
                    MealSectionWidget(
                      title: "Post-Workout Meal",
                      items: vm.postWorkout,
                    ),

                    MealSectionWidget(title: "Breakfast", items: vm.breakfast),
                    MealSectionWidget(title: "Lunch", items: vm.lunch),
                    MealSectionWidget(title: "Dinner", items: vm.dinner),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// -------- SECTION WIDGET (LIKE IMAGE) --------
class MealSectionWidget extends StatelessWidget {
  final String title;
  final List<FoodItem> items;

  const MealSectionWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    /// Calculate nutrition summary
    double totalCarb = 0, totalProtein = 0, totalFat = 0;
    for (var item in items) {
      totalCarb += double.tryParse(item.carbs) ?? 0;
      totalProtein += double.tryParse(item.protein) ?? 0;
      totalFat += double.tryParse(item.fat) ?? 0;
    }
    double totalKcal = (totalCarb * 4) + (totalProtein * 4) + (totalFat * 9);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 22),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.asset(
              "assets/images/preworkout.png",
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15.8,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        /// FOOD CARDS
        ...items.map((item) => FoodCard(item: item)),

        const SizedBox(height: 6),

        /// SUMMARY BAR
        Row(
          children: const [
            Icon(Icons.bar_chart, size: 16, color: Colors.blue),
            SizedBox(width: 6),
          ],
        ),
        Text(
          "≈ ${totalKcal.toStringAsFixed(0)} Kcal | "
          "Protein: ${totalProtein.toStringAsFixed(1)}g | "
          "Carbs: ${totalCarb.toStringAsFixed(1)}g | "
          "Fats: ${totalFat.toStringAsFixed(1)}g",
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),

        const SizedBox(height: 28),
        Divider(color: Colors.black12, height: 1),
      ],
    );
  }
}

/// -------- FOOD CARD SAME AS SCREENSHOT --------
class FoodCard extends StatelessWidget {
  final FoodItem item;
  const FoodCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.media.isNotEmpty ? item.media.first.url : "",
              height: 78,
              width: 78,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 78,
                width: 78,
                color: Colors.grey.shade200,
                child: const Icon(Icons.fastfood, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 10),

          /// NAME & MACROS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14.8,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Carbs: ${item.carbs}g",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black54),
                ),
                Text(
                  "Protein: ${item.protein}g",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black54),
                ),
                Text(
                  "Fat: ${item.fat}g",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
