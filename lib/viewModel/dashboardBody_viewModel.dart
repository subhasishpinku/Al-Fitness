import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dashboard_model.dart';
import '../repository/dashboard_repository.dart';

class DashboardBodyViewModel extends ChangeNotifier {
  final DashboardRepository _repo = DashboardRepository();

  bool isLoading = false;

  double currentWeight = 0;
  String targetWeight = "";
  double dailyCalories = 0;
  double weekProgress = 3.5; // 25% completed

  int weekNumber = 1;
  String gender = ""; //  NEW added
  String day = "";
  String logValue = "";
  String? deload_week = "";
  String? progressive_week = "";
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
      print("WonDeviceId ${deviceId} ${userId}");
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
      // int?  weekProgress = data.dayDetails!.week;
      deload_week = data.weekFlags!.deloadWeek!;
      progressive_week = data.weekFlags!.deloadWeek!;
      prefs.setString("deload_week", deload_week!);
      prefs.setString("progressive_week", progressive_week!);

      int week = data.dayDetails!.week ?? 1;

      // total weeks = 4 (you can change if needed)
      const totalWeeks = 4;

      // progress must be between 0–1
      weekProgress = (week / totalWeeks).clamp(0.0, 1.0);

      /// ----------------------------------------
      ///   CURRENT PHASE PROGRESS
      /// ----------------------------------------
      final phaseList = data.newAppData?.phaseSummaryDynamic ?? [];
      final currentPhase = data.newAppData?.currentPhase;
      targetWeight = data.currentWeekTargetWeightValue ?? "";

      for (var item in phaseList) {
        if (item.phase == currentPhase) {
          currentWeight = double.tryParse(item.startWeight ?? "0") ?? 0;
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
