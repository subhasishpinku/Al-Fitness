import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/viewModel/signin_twelve_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreenTwelve extends StatelessWidget {
  const SigninScreenTwelve({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SigninTwelveViewModel>(
      context,
      listen: false,
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninSecondAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "You're currently at 40+% body fat percentage.\nWhat's your goal body fat percentage?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Tap the image that matches your desired body fat percentage",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),

                /// Grid of body fat options
                Expanded(
                  child: Consumer<SigninTwelveViewModel>(
                    builder: (context, viewModel, _) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: viewModel.bodyFatList.length,
                        itemBuilder: (context, index) {
                          final item = viewModel.bodyFatList[index];
                          final isSelected = viewModel.selectedIndex == index;

                          return GestureDetector(
                            onTap: () async {
                              await viewModel.selectIndex(index);
                              final prefs =
                                  await SharedPreferences.getInstance();
                              String? plan_type = prefs.getString("plan_type");
                              if (plan_type == "muscle_gain") {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.muscleGain,
                                );
                              } else {
                                if (context.mounted) {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.signinScreenThirteen,
                                  );
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        item['image']!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item['percent']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
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
