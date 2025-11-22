import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:aifitness/viewModel/signin_twenty_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreenTwenty extends StatelessWidget {
  const SigninScreenTwenty({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninTwentyViewModel>(context);

    // Load API Only Once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.foods.isEmpty && provider.isLoading == false) {
        provider.fetchFoods();
      }
    });

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninSecondAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Select the fiber sources you'd like to include in your meal plan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Please select a minimum of 2 items and a maximum of 5 items.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.errorMessage.isNotEmpty
                    ? Center(child: Text(provider.errorMessage))
                    : GridView.builder(
                        itemCount: provider.foods.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1,
                            ),
                        itemBuilder: (context, index) {
                          final item = provider.foods[index];
                          final rawItem = item.rawItem ?? "";
                          // final isSelected = provider.selectedItems.contains(
                          //   name,
                          // );
                      final bool isSelected = provider.selectedItems.contains(item.name);

                          return GestureDetector(
                            onTap: () => provider.toggleSelection(item),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : Colors.grey.shade500,
                                  width: 2,
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      rawItem,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  if (isSelected)
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        padding: const EdgeInsets.all(3),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const SizedBox(height: 10),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: provider.canProceed
                      ? () => provider.onNextPressed(context)
                      : null,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
