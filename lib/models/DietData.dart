import 'package:aifitness/models/FoodItem.dart';

// class DietData {
//   final List<FoodItem> breakfast;
//   final List<FoodItem> lunch;
//   final List<FoodItem> dinner;

//   DietData({
//     required this.breakfast,
//     required this.lunch,
//     required this.dinner,
//   });

//   factory DietData.fromJson(Map<String, dynamic> json) {
//     return DietData(
//       breakfast: (json["breakfast"] as List)
//           .map((e) => FoodItem.fromJson(e))
//           .toList(),
//       lunch: (json["lunch"] as List)
//           .map((e) => FoodItem.fromJson(e))
//           .toList(),
//       dinner: (json["dinner"] as List)
//           .map((e) => FoodItem.fromJson(e))
//           .toList(),
//     );
//   }
// }

class DietData {
  final List<FoodItem> breakfast;
  final List<FoodItem> lunch;
  final List<FoodItem> dinner;
  final List<FoodItem>? preWorkout;
  final List<FoodItem>? postWorkout;
  final List<FoodItem>? snacks;

  DietData({
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    this.preWorkout,
    this.postWorkout,
    this.snacks,
  });

  factory DietData.fromJson(Map<String, dynamic> json) {
    return DietData(
      breakfast: (json["breakfast"] as List).map((e) => FoodItem.fromJson(e)).toList(),
      lunch: (json["lunch"] as List).map((e) => FoodItem.fromJson(e)).toList(),
      dinner: (json["dinner"] as List).map((e) => FoodItem.fromJson(e)).toList(),
      preWorkout: json["pre_workout"] != null
          ? (json["pre_workout"] as List).map((e) => FoodItem.fromJson(e)).toList()
          : [],
      postWorkout: json["post_workout"] != null
          ? (json["post_workout"] as List).map((e) => FoodItem.fromJson(e)).toList()
          : [],
      snacks: json["snacks"] != null
          ? (json["snacks"] as List).map((e) => FoodItem.fromJson(e)).toList()
          : [],
    );
  }
}

