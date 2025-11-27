import 'package:aifitness/utils/app_colors.dart';
import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/viewModel/signin_thirteen_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreenThirteen extends StatelessWidget {
  const SigninScreenThirteen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SigninThirteenViewModel()..fetchFatLossDataFromPrefs(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: const SigninSecondAppBar(),
          body: SafeArea(
            child: Consumer<SigninThirteenViewModel>(
              builder: (context, viewModel, _) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.errorMessage != null) {
                  return Center(
                    child: Text('Error: ${viewModel.errorMessage}'),
                  );
                }

                if (viewModel.fatLossData == null) {
                  return const Center(child: Text('No data available'));
                }

                return const FatLossContent();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FatLossContent extends StatelessWidget {
  const FatLossContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SigninThirteenViewModel>(context);

    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final data = vm.fatLossData;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SingleChildScrollView(
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
                  side: BorderSide(color: AppColors.signInButtonColor),
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
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  backgroundColor: AppColors.backgroundColor,
                  side: BorderSide(
                    color: AppColors.bolderColor,
                    width: 0.5, // (optional) you can change thickness
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "BMI: ${data?['current_bmi']} (${data?['current_bmi_cat']})",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Current Weight: ${data?['current_weight_value']}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Goal: ${data?['target_bfp']}% body fat (Target: ${data?['target_weight']} kg)",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Total Loss: ${data?['totalLoss']} kg in ~${data?['weeks_to_target_dynamic']} weeks (${data?['loss_gain_target_value']} kg/week)",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
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

            Align(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  backgroundColor: AppColors.backgroundColor,
                  side: BorderSide(
                    color: AppColors.bolderColor,
                    width: 0.5, // (optional) you can change thickness
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Target Weight: ${data?['phase_summary_dynamic'][0]['end_weight']} kg (~${data?['phase_summary_dynamic'][0]['duration_weeks']} weeks)",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Current Intake: ${data?['current_calories_intake']} kcal/day",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "New Intake: ${data?['phase_summary_dynamic'][0]['daily_calories']} kcal/day (${data?['phase_summary_dynamic'][0]['deficient_calories']} kcal)",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
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
                  backgroundColor: AppColors.backgroundColor,
                  side: BorderSide(
                    color: AppColors.bolderColor,
                    width: 0.5, // (optional) you can change thickness
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "Adjust calories again after reaching ${data?['phase_summary_dynamic'][0]['end_weight']} kg",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
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
            Align(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.signinScreenFourteen);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  backgroundColor: AppColors.backgroundColor,

                  // Main fix
                  side: BorderSide(
                    color: AppColors.bolderColor,
                    width: 1.4, // (optional) you can change thickness
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Create My Nutrition & Exercise Plan",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
