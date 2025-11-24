import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dashboard_model.dart';
import '../repository/dashboard_repository.dart';

class DashboardBodyViewModel extends ChangeNotifier {
  final DashboardRepository _repo = DashboardRepository();

  bool isLoading = false;

  double currentWeight = 0;
  double targetWeight = 0;
  double dailyCalories = 0;

  int weekNumber = 1;
  String gender = ""; //  NEW added
  String day = "";
  String logValue = "";

  //  Line Chart Arrays (MATCHING iOS)
  List<double> weightData = [];
  List<double> bfpData = [];
  List<double> skeletalData = [];
  List<double> waterData = [];
  List<double> subcutaneousData = [];
  List<double> visceralData = [];

  Future<void> loadDashboard() async {
    try {
      isLoading = true;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      String deviceId = prefs.getString("device_id") ?? "123456";
      int? userId = prefs.getInt("user_id") ?? 0;

      DashboardModel model = await _repo.fetchDashboardData(
        userId: userId,
        deviceId: deviceId,
        deviceType: "android",
      );

      final data = model.data;
      if (data == null) {
        isLoading = false;
        notifyListeners();
        return;
      }

      /// ----------------------------------------
      ///   BASIC UI VALUES
      /// ----------------------------------------
      weekNumber = data.dayDetails?.week ?? 1;
      day = data.dayDetails?.day ?? "8";
      gender = data.userDetails?.gender ?? ""; //  added
      prefs.setInt("week", weekNumber);
      prefs.setString("day", day);
      prefs.setString("gender", gender);
      print("day $day");

      /// ----------------------------------------
      ///   LINE CHART VALUES  — iOS Matching
      /// ----------------------------------------
      weightData = _toDoubleList(data.latestWeightLogs);
      skeletalData = _toDoubleList(data.latestSkeletalMuscleLogs);
      bfpData = _toDoubleList(data.latestBodyFatPercentageLogs);
      waterData = _toDoubleList(data.latestTotalBodyWaterLogs);
      subcutaneousData = _toDoubleList(data.latestSubcutaneousFatLogs);
      visceralData = _toDoubleList(data.latestVisceralFatLevelLogs);

      /// ----------------------------------------
      ///   CURRENT PHASE PROGRESS
      /// ----------------------------------------
      final phaseList = data.newAppData?.phaseSummaryDynamic ?? [];
      final currentPhase = data.newAppData?.currentPhase;

      for (var item in phaseList) {
        if (item.phase == currentPhase) {
          currentWeight = double.tryParse(item.startWeight ?? "0") ?? 0;
          targetWeight = double.tryParse(item.endWeight ?? "0") ?? 0;
          dailyCalories = double.tryParse(item.dailyCalories ?? "0") ?? 0;
        }
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("ERROR = $e");
      isLoading = false;
      notifyListeners();
    }
  }

  /// Converts all logs to double list
  List<double> _toDoubleList(dynamic list) {
    if (list == null) return [];
    return List<double>.from(
      list.map((e) => double.tryParse(e["log_value"].toString()) ?? 0),
    );
  }
}
