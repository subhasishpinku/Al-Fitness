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
    final fatsList = decodeList(prefs.getString("fat"));
    final fibersList = decodeList(prefs.getString("fibers"));
    final woDaysList = decodeList(prefs.getString("wo_days"));
    final focusMuscleList = decodeList(prefs.getString("focus_muscle"));

    // RegisterRequest model = RegisterRequest(
    //   name: name,
    //   hip: prefs.getString("hip") ?? "",
    //   noOfDaysPerWeek: prefs.getInt("no_of_days_per_week") ?? 0,
    //   woTime: "45",
    //   password: password,
    //   email: email,
    //   fitnessGoal: prefs.getString("fitness_goal") ?? "",
    //   currentBfp: prefs.getString("current_bfp") ?? "",

    //   grains: grainsList ?? [],
    //   fruits: fruitsList ?? [],
    //   carbs: carbsList ?? [],
    //   vegetables: vegetablesList ?? [],
    //   nuts: nutsList ?? [],
    //   proteins: proteinsList ?? [],
    //   fats: fatsList ?? [],
    //   fibers: [],
    //   focusMuscle: [],
    //   woDays: [],

    //   waist: prefs.getString("waist") ?? "",
    //   planType: prefs.getString("plan_type") ?? "",

    //   currentBodyShape: prefs.getString("current_body_shape") ?? "3",
    //   heightUnit: "CM",
    //   desiredBodyShape: "3",
    //   woModeSubOption: "",
    //   targetBfp: (prefs.getString("target_bfp") ?? "").replaceAll("%", ""),
    //   currentWeightValue: prefs.getString("current_weight_value") ?? "",

    //   activityLevel: prefs.getString("activity_level") ?? "",
    //   hipUnit: "CM",
    //   waistUnit: "CM",

    //   dobAgeMonth: "0",
    //   woGoal: prefs.getString("wo_goal") ?? "",
    //   deviceId: prefs.getString("device_id") ?? "",
    //   woMode: prefs.getString("wo_mode") ?? "",

    //   skeletalMuscle: "",
    //   subcutaneousFatPercentage: "",
    //   dobAgeYear: prefs.getString("dob_age_year") ?? "",
    //   heightValue: prefs.getString("height_value") ?? "",
    //   howFastToReachGoal: prefs.getString("how_fast_to_reach_goal") ?? "",

    //   visceralFat: "",
    //   waterWeight: "",
    //   currentWeightUnit: "KG",
    //   lossGainTargetValue: "",
    //   gender: prefs.getString("gender") ?? "",
    //   mealTypeSubOption: "",
    //   mealType: prefs.getString("meal_type") ?? "",
    // );
    RegisterRequest model = RegisterRequest(
      name: name,
      email: email,
      password: password,
      gender: "M",
      dobAgeYear: "1980",
      dobAgeMonth: "0",
      heightValue: "150",
      heightUnit: "CM",
      currentWeightValue: "60.0",
      currentWeightUnit: "KG",
      waist: "60",
      waistUnit: "CM",
      hip: "65",
      hipUnit: "CM",
      currentBfp: "40",
      targetBfp: "25",
      currentBodyShape: "3",
      desiredBodyShape: "3",
      skeletalMuscle: "",
      subcutaneousFatPercentage: "",
      visceralFat: "",
      waterWeight: "",
      planType: "weight_fat_loss",
      fitnessGoal: "Strength",
      woGoal: "Lose Weight",
      activityLevel: "Sedentary Exercise",
      howFastToReachGoal: "Easy",
      lossGainTargetValue: "0",
      woMode: "Gym",
      woModeSubOption: "",
      woTime: "30",
      noOfDaysPerWeek: 1,
      woDays: [],
      focusMuscle: [],
      mealType: "Non Veg",
      mealTypeSubOption: "",
      grains: ["Oats", "1/2 Cup Cooked Brown Rice (100 g)"],
      fruits: ["Bananas", "Pears"],
      vegetables: ["Pears", "Brussels Sprouts"],
      proteins: ["Greek Yogurt", "100g of cooked beef"],
      carbs: ["Oats", "Sweet Potatoes"],
      fats: ["Olive Oil", "½ cup cooked chia seeds (~120 g)"],
      nuts: ["Peanut butter 30gm with Brown Bread 2pc", "Pistachios"],
      fibers: [],
      deviceId: "F6E5F462-57E9-4E47-99D1-C3B785BC97E6",
    );

    print("""
===== FINAL REQUEST JSON =====

Name: $name
Hip: ${prefs.getString("hip") ?? ""}
No. of Days per Week: ${prefs.getInt("no_of_days_per_week") ?? 0}
WO Time: 45
Password: $password
Email: $email

Fitness Goal: ${prefs.getString("fitness_goal") ?? ""}
Current BFP: ${prefs.getString("current_bfp") ?? ""}

Grains: $grainsList
Fruits: $fruitsList
Carbs: $carbsList
Vegetables: $vegetablesList
Nuts: $nutsList
Proteins: $proteinsList
Fats: $fatsList
Fibers: $fibersList
Focus Muscle: $focusMuscleList
Workout Days: $woDaysList

Waist: ${prefs.getString("waist") ?? ""}
Plan Type: ${prefs.getString("plan_type") ?? ""}

Current Body Shape: ${prefs.getString("current_body_shape") ?? "3"}
Height Unit: CM
Desired Body Shape: 3

Target BFP: ${(prefs.getString("target_bfp") ?? "").replaceAll("%", "")}
Current Weight Value: ${prefs.getString("current_weight_value") ?? ""}

Activity Level: ${prefs.getString("activity_level") ?? ""}
Hip Unit: CM
Waist Unit: CM

DOB Age Month: 0
Workout Goal: ${prefs.getString("wo_goal") ?? ""}
Device ID: ${prefs.getString("device_id") ?? ""}
Workout Mode: ${prefs.getString("wo_mode") ?? ""}

Skeletal Muscle: 
Subcutaneous Fat %: 
DOB Age Year: ${prefs.getString("dob_age_year") ?? ""}
Height Value: ${prefs.getString("height_value") ?? ""}
How Fast To Reach Goal: ${prefs.getString("how_fast_to_reach_goal") ?? ""}

Visceral Fat: 
Water Weight: 
Current Weight Unit: KG
Loss/Gain Target Value: 
Gender: ${prefs.getString("gender") ?? ""}
Meal Type Sub Option: 
Meal Type: ${prefs.getString("meal_type") ?? ""}

================================
""");

    print("""
===== FINAL REQUEST JSON1 =====



Skeletal Muscle: 
Subcutaneous Fat %: 
DOB Age Year: ${prefs.getString("dob_age_year") ?? ""}
Height Value: ${prefs.getString("height_value") ?? ""}
How Fast To Reach Goal: ${prefs.getString("how_fast_to_reach_goal") ?? ""}

Visceral Fat: 
Water Weight: 
Current Weight Unit: KG
Loss/Gain Target Value: 
Gender: ${prefs.getString("gender") ?? ""}
Meal Type Sub Option: 
Meal Type: ${prefs.getString("meal_type") ?? ""}

================================
""");

    // print("FINAL REQUEST JSON = ${jsonEncode(model.toJson())}");

    try {
      registerResponse = await repository.registerUser(model);
      errorMessage = null;
      print("FINAL REQUEST JSON = ${registerResponse!.data!.userDetails!.id}");
      final prefs = await SharedPreferences.getInstance();
      int? userIds = registerResponse!.data!.userDetails!.id;
      await prefs.setInt('user_id', userIds!);
      String? deviceIdS = registerResponse!.data!.userDetails!.deviceId;
      await prefs.setString('device_id', deviceIdS!);
      print("ResponseAllIds ${userIds}  ${deviceIdS}");
      // Show success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(registerResponse?.message ?? "Registration successful"),
        ),
      );
      Navigator.pushNamed(context, RouteNames.signinScreenTwentyFive);

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
