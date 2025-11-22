import 'package:aifitness/models/DietData.dart';

class DietResponse {
  final bool success;
  final String message;
  final DietData? data;

  DietResponse({required this.success, required this.message, this.data});

  factory DietResponse.fromJson(Map<String, dynamic> json) {
    return DietResponse(
      success: json["success"],
      message: json["message"],
      data: json["data"] != null ? DietData.fromJson(json["data"]) : null,
    );
  }
}
