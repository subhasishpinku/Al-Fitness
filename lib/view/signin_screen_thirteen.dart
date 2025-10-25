import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:flutter/material.dart';

class SigninScreenThirteen extends StatefulWidget {
  const SigninScreenThirteen({super.key});

  @override
  State<SigninScreenThirteen> createState() => _SigninScreenThirteenState();
}

class _SigninScreenThirteenState extends State<SigninScreenThirteen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninSecondAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicWidth(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 15,
                      ),
                      side: BorderSide(color: AppColors.backgroundColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: AppColors.primaryColor,
                      backgroundColor: AppColors.signInButtonColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Based on Your Information, Here\nIs Your Fat Loss Target",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- BMI and weight section ---
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("BMI:"),
                        ),
                        SizedBox(height: 4),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("Current Weight:"),
                        ),
                        SizedBox(height: 4),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("Goal:"),
                        ),
                        SizedBox(height: 4),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("Total Loss:"),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Step 1: First Milestone",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                // --- Milestone card ---
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("Target Weight:"),
                        ),
                        SizedBox(height: 4),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("Current Weight:"),
                        ),
                        SizedBox(height: 4),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("New Intake:"),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Step 2: Final Goal",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text("gdf:"),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Tap the button to create your plan",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),

                const SizedBox(height: 20),

                // --- CTA button ---
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            "Create My Nutrition & Exercise Plan",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
