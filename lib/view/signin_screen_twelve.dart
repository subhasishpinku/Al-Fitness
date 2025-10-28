// signin_screen_twelve.dart
import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/viewModel/signin_twelve_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';

class SigninScreenTwelve extends StatelessWidget {
  const SigninScreenTwelve({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyFatList = [
      {'percent': '9%', 'image': 'assets/images/body_shape_1.png'},
      {'percent': '11%', 'image': 'assets/images/body_shape_2.png'},
      {'percent': '13%', 'image': 'assets/images/body_shape_3.png'},
      {'percent': '15%', 'image': 'assets/images/body_shape_4.png'},
      {'percent': '17%', 'image': 'assets/images/body_shape_5.png'},
      {'percent': '19%', 'image': 'assets/images/body_shape_6.png'},
      {'percent': '21%', 'image': 'assets/images/body_21.jpeg'},
      {'percent': '23%', 'image': 'assets/images/body_18.jpeg'},
      {'percent': '25%', 'image': 'assets/images/body_15.jpeg'},
    ];

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
                  "You're currently at 40+% body fat \n percentage.What's your goal body fat \n percentage?",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Top the image that matches your desired \n body fat percentage",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
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
                        itemCount: bodyFatList.length,
                        itemBuilder: (context, index) {
                          final item = bodyFatList[index];
                          final isSelected = viewModel.selectedIndex == index;
                          return GestureDetector(
                            onTap: () => {
                              viewModel.selectIndex(index),
                              Navigator.pushNamed(
                                context,
                                RouteNames.signinScreenThirteen,
                              ),
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                // color: isSelected
                                //     ? Colors.blue.withOpacity(0.2)
                                //     : Colors.transparent,
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      item['image']!,
                                      fit: BoxFit.cover,
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
