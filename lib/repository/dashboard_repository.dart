import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dashboard_model.dart';

class DashboardRepository {
  Future<DashboardModel> fetchDashboardData({
    required int userId,
    required String deviceId,
    required String deviceType,
  }) async {
    final url = Uri.parse(
      "https://aipoweredfitness.com/api/dashboard-details-api-ai?test=1",
    );

    final response = await http.post(
      url,
      body: {
        "user_id": userId.toString(),
        "device_id": deviceId,
        "device_type": deviceType,
      },
    );

    if (response.statusCode == 200) {
      return dashboardModelFromJson(response.body);
    } else {
      throw Exception("API error: ${response.statusCode}");
    }
  }
}
