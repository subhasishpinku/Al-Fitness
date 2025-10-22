import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:aifitness/viewModel/signin_eleventh_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreenEleventh extends StatelessWidget {
  const SigninScreenEleventh({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SigninEleventhViewModel(),
      child: const _SigninScreenEleventhBody(),
    );
  }
}

class _SigninScreenEleventhBody extends StatelessWidget {
  const _SigninScreenEleventhBody();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninEleventhViewModel>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninSecondAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // --- Description ---
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
                      "If you have done a body composition \n analysis, you can manually enter your \n body fat percentage.",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // --- Manual Entry Button ---
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: () {
                      provider.enterManually(context);
                    },
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
                    child: Text(
                      "Tap to Enter Manually",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // --- OR text ---
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    "OR",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // --- Instruction ---
                const Text(
                  "Select your body fat percentage from the \n reference images to support your fitness \n .goals",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 20),

                // --- Grid of images ---
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: provider.bodyFatImages.length,
                    itemBuilder: (context, index) {
                      final item = provider.bodyFatImages[index];
                      final isSelected =
                          item['percentage'] == provider.selectedFat;

                      return GestureDetector(
                        onTap: () {
                          provider.selectFat(item['percentage']);
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item['image'],
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${item['percentage']}%",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // --- Next Button ---
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColors.primaryColor),
                        ),
                        elevation: 0,
                      ),
                      onPressed: provider.selectedFat == null
                          ? null
                          : () {
                              // Navigator.pushNamed(
                              //     context, RouteNames.signinScreenThirteen);
                            },
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
