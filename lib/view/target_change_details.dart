import 'package:aifitness/viewModel/target_change_details_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TargetChangeDetails extends StatefulWidget {
  const TargetChangeDetails({super.key});

  @override
  State<TargetChangeDetails> createState() => _TargetChangeDetailsState();
}

class _TargetChangeDetailsState extends State<TargetChangeDetails> {
  int userId = 0;
  String? deviceId = "";
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("user_id") ?? 0;
    deviceId = prefs.getString("device_id");

    if (deviceId == null) return;

    // Kick off fetching categories + initial news
    Future.microtask(() {
      final vm = context.read<TargetChangeDetailsViewModel>();
      vm.fetchAiDetails(deviceId!, userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TargetChangeDetailsViewModel>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black, // black circle
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.white, // white "X"
                    ),
                  ),
                ),
              ),

              const Text(
                "Change Detail",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle("Tell us about yourself"),
              const SizedBox(height: 10),

              CustomDropTile(
                title: "What's your height?",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.heightValue} KG",
              ),
              CustomDropTile(
                title: "What's your weight?",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.weightValue} KG",
              ),

              const SizedBox(height: 25),

              _sectionTitle("Workout Options"),
              const SizedBox(height: 10),

              CustomDropTile(
                title: "What is your fitness goal?",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.fitnessGoal}",
              ),
              CustomDropTile(
                title: "Current activity level",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.activityLevel}",
              ),
              CustomDropTile(
                title: "Current body fat percentage",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.currentBfp}%",
              ),
              CustomDropTile(
                title: "Target body fat percentage",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.targetBfp}%",
              ),
              CustomDropTile(
                title: "What day's would you like to workout?",
                value:
                    "${vm.aiDetails!.data!.userBodyMetrics!.noOfDaysPerWeek} Day / Week (6 days rest)",
              ),
              CustomDropTile(
                title: "Workout mode",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.woMode}",
              ),

              const SizedBox(height: 25),

              _sectionTitle("Selects Food"),
              const SizedBox(height: 10),

              CustomDropTile(
                title: "Diet type",
                value: "${vm.aiDetails!.data!.userBodyMetrics!.mealType}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
        ],
      ),
    );
  }
}

class CustomDropTile extends StatelessWidget {
  final String title;
  final String value;

  const CustomDropTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12, // or any color
              ),
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }
}
