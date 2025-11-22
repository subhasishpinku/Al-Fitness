import 'package:aifitness/data/network/api_service.dart';
import 'package:aifitness/models/DietResponse.dart';

class DietRepository {
  final ApiService _api = ApiService();

  Future<DietResponse> getDietPlan({
    required int week,
    required int userId,
    required String dayType,
    required String day,
  }) async {
    final response = await _api.postRequest("get-diet-day-wise-new-app-test", {
      "week": week,
      "user_id": userId,
      "day_type": dayType,
      "day": day,
    });

    return DietResponse.fromJson(response.data);
  }
}
