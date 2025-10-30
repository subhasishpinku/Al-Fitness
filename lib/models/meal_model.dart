class MealItem {
  final String name;
  final String image;
  final String carbs;
  final String protein;
  final String fats;

  MealItem({
    required this.name,
    required this.image,
    required this.carbs,
    required this.protein,
    required this.fats,
  });
}

class MealSection {
  final String title;
  final String totalKcal;
  final List<MealItem> items;

  MealSection({
    required this.title,
    required this.totalKcal,
    required this.items,
  });
}
