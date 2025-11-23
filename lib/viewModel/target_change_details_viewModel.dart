import 'package:aifitness/models/ai_details_model.dart';
import 'package:aifitness/repository/ai_details_repository.dart';
import 'package:flutter/material.dart';

class TargetChangeDetailsViewModel extends ChangeNotifier {
  // Example Variables
  String height = "150 CM";
  String weight = "60 KG";

  void updateHeight(String val) {
    height = val;
    notifyListeners();
  }

  void updateWeight(String val) {
    weight = val;
    notifyListeners();
  }

  final AiDetailsRepository _repo = AiDetailsRepository();

  bool loading = false;
  AiDetailsResponse? aiDetails;

  Future<void> fetchAiDetails(String deviceId, int userId) async {
    loading = true;
    notifyListeners();

    try {
      aiDetails = await _repo.getAiUserDetails(
        deviceId: deviceId,
        userId: userId,
      );

      print("aiDetails: ${aiDetails!.data!.userBodyMetrics!.heightValue}");
    } catch (e) {
      debugPrint("Error fetching AI details: $e");
      print("Error fetching AI details: $e");
    }

    loading = false;
    notifyListeners();
  }
}
