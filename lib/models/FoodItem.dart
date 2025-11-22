class FoodItem {
  final String id;
  final String name;
  final String rawItem;
  final String quantityUnit;
  final String calories;
  final String carbs;
  final String protein;
  final String fat;
  final String quantityUi;
  final List<FoodMedia> media;

  FoodItem({
    required this.id,
    required this.name,
    required this.rawItem,
    required this.quantityUnit,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.quantityUi,
    required this.media,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json["id"],
      name: json["name"],
      rawItem: json["raw_item"],
      quantityUnit: json["quantity_unit"],
      calories: json["calories"],
      carbs: json["carbs"],
      protein: json["protein"],
      fat: json["fat"],
      quantityUi: json["quantity_ui"],
      media: json["media_decoded"] == null
          ? []
          : (json["media_decoded"] as List)
              .map((e) => FoodMedia.fromJson(e))
              .toList(),
    );
  }
}

class FoodMedia {
  final String url;

  FoodMedia({required this.url});

  factory FoodMedia.fromJson(Map<String, dynamic> json) {
    return FoodMedia(url: json["url"]);
  }
}
