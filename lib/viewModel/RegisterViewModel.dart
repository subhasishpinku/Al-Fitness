import 'dart:convert';
import 'package:aifitness/models/register_request.dart';
import 'package:aifitness/models/register_response.dart';
import 'package:aifitness/repository/RegisterRepository.dart';
import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterRepository1 repository;

  RegisterViewModel(this.repository);

  bool loading = false;
  RegisterResponse? registerResponse;
  String? errorMessage;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  List<String>? decodeList(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      return List<String>.from(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  Future<void> onNextPressed(BuildContext context) async {
    final name = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    loading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    final grainsList = decodeList(prefs.getString("grains"));
    final fruitsList = decodeList(prefs.getString("fruit"));
    final carbsList = decodeList(prefs.getString("carbs"));
    final vegetablesList = decodeList(prefs.getString("vegetables"));
    final nutsList = decodeList(prefs.getString("nut"));
    final proteinsList = decodeList(prefs.getString("proteins"));
    final fatsList = decodeList(prefs.getString("fats"));
    final fibersList = decodeList(prefs.getString("fibers"));
    final woDaysList = decodeList(prefs.getString("wo_days"));
    final focusMuscleList = decodeList(prefs.getString("focus_muscle"));

    RegisterRequest model = RegisterRequest(
      name: name,
      hip: prefs.getString("hip") ?? "",
      noOfDaysPerWeek: prefs.getInt("no_of_days_per_week") ?? 0,
      woTime: "45",
      password: password,
      email: email,
      fitnessGoal: prefs.getString("fitness_goal") ?? "",
      currentBfp: prefs.getString("current_bfp") ?? "",

      grains: grainsList ?? [],
      fruits: fruitsList ?? [],
      carbs: carbsList ?? [],
      vegetables: vegetablesList ?? [],
      nuts: nutsList ?? [],
      proteins: proteinsList ?? [],
      fats: fatsList ?? [],
      fibers: fibersList ?? [],
      focusMuscle: focusMuscleList ?? [],
      woDays: woDaysList ?? [],

      waist: prefs.getString("waist") ?? "",
      planType: prefs.getString("plan_type") ?? "",

      currentBodyShape: prefs.getString("current_body_shape") ?? "3",
      heightUnit: "CM",
      desiredBodyShape: "3",
      woModeSubOption: "",
      targetBfp: (prefs.getString("target_bfp") ?? "").replaceAll("%", ""),
      currentWeightValue: prefs.getString("current_weight_value") ?? "",

      activityLevel: prefs.getString("activity_level") ?? "",
      hipUnit: "CM",
      waistUnit: "CM",

      dobAgeMonth: "0",
      woGoal: prefs.getString("wo_goal") ?? "",
      deviceId: prefs.getString("device_id") ?? "",
      woMode: prefs.getString("wo_mode") ?? "",

      skeletalMuscle: "",
      subcutaneousFatPercentage: "",
      dobAgeYear: prefs.getString("dob_age_year") ?? "",
      heightValue: prefs.getString("height_value") ?? "",
      howFastToReachGoal: prefs.getString("how_fast_to_reach_goal") ?? "",

      visceralFat: "",
      waterWeight: "",
      currentWeightUnit: "KG",
      lossGainTargetValue: "",
      gender: prefs.getString("gender") ?? "",
      mealTypeSubOption: "",
      mealType: prefs.getString("meal_type") ?? "",
    );

    print("FINAL REQUEST JSON = ${jsonEncode(model.toJson())}");

    try {
      registerResponse = await repository.registerUser(model);
      errorMessage = null;
      // Show success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(registerResponse?.message ?? "Registration successful"),
        ),
      );
      Navigator.pushNamed(context, RouteNames.loginScreen);

      // Navigate or do next step
    } catch (e) {
      errorMessage = e.toString();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $errorMessage")));
      print(errorMessage);
    }

    loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
