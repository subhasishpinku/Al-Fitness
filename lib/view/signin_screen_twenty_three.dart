import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:aifitness/utils/app_colors.dart';
import 'package:aifitness/viewModel/signin_twentythree_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreenTwentyThree extends StatefulWidget {
  const SigninScreenTwentyThree({super.key});

  @override
  State<SigninScreenTwentyThree> createState() =>
      _SigninScreenTwentyThreeState();
}

class _SigninScreenTwentyThreeState extends State<SigninScreenTwentyThree> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SigninTwentyThreeViewModel()..fetchFoods(), // IMPORTANT
      child: Consumer<SigninTwentyThreeViewModel>(
        builder: (context, viewModel, _) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: const SigninSecondAppBar(),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select the fat sources you’d like to include in your meal plan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please select a minimum of 2 items and a maximum of 5 items.",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(height: 20),

                    /// ---------------- LOADING STATE ----------------
                    if (viewModel.isLoading)
                      const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      ),

                    /// ---------------- ERROR STATE ----------------
                    if (!viewModel.isLoading &&
                        viewModel.errorMessage.isNotEmpty)
                      Expanded(
                        child: Center(
                          child: Text(
                            viewModel.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),

                    /// ---------------- SUCCESS STATE ----------------
                    if (!viewModel.isLoading && viewModel.errorMessage.isEmpty)
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                              ),
                          itemCount: viewModel.foods.length,
                          itemBuilder: (context, index) {
                            final item = viewModel.foods[index];
                            final rawItem = item.rawItem ?? "";
                            final bool isSelected = viewModel.selectedItems
                                .contains(item.name);

                            return GestureDetector(
                              onTap: () => viewModel.toggleSelection(item),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: isSelected
                                            ? AppColors.bolderColor
                                            : AppColors.bolderColor,
                                        width: 2,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      rawItem,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

                                  if (isSelected)
                                    const Positioned(
                                      bottom: 8,
                                      right: 6,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    /// ---------------- NEXT BUTTON ----------------
                    // Center(
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: AppColors.primaryColor,
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 40,
                    //         vertical: 12,
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //     ),
                    //     onPressed: viewModel.canProceed
                    //         ? () => viewModel.onNextPressed(context)
                    //         : null,
                    //     child: const Text(
                    //       "Next",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 120,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: AppColors.bolderColor),
                            ),
                            elevation: 0,
                          ),
                          onPressed: viewModel.canProceed
                              ? () => viewModel.onNextPressed(context)
                              : null,
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
