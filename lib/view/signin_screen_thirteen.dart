import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/viewModel/signin_thirteen_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';

class SigninScreenThirteen extends StatelessWidget {
  const SigninScreenThirteen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SigninThirteenViewModel()..fetchFatLossData(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: const SigninSecondAppBar(),
          body: const SafeArea(child: FatLossContent()),
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
            Align(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  backgroundColor: AppColors.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "BMI: ${data['BMI']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Current Weight: ${data['CurrentWeight']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Goal: ${data['Goal']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Total Loss: ${data['TotalLoss']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Target Weight: ${data['FirstMilestone']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "Current Weight: ${data['CurrentWeight']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "New Intake: ${data['NewIntake']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "gdf: ${data['FinalGoal']}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: AppColors.primaryColor),
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
