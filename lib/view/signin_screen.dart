import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/viewModel/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninViewModel>(context);
    final topics = provider.topics;
    final isVisible = provider.isVisible;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- Top Bar ----------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.signInButtonColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "AI FITNESS",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // ---------- Header ----------
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntrinsicWidth(
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
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          textAlign: TextAlign.right,
                          "What are you looking for in your \n fitness journey?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "Select a topic below",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 30),

                // ---------- Animated Buttons ----------
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Expanded(
                    child: ListView.separated(
                      itemCount: topics.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        return AnimatedOpacity(
                          opacity: isVisible[index] ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: Transform.translate(
                            offset: isVisible[index]
                                ? Offset.zero
                                : const Offset(0, 30),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IntrinsicWidth(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 15,
                                    ),
                                    side: BorderSide(
                                      color: AppColors.primaryColor,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    foregroundColor: AppColors.primaryColor,
                                    backgroundColor:
                                        AppColors.backgroundColor,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () =>
                                      provider.onTopicSelected(topics[index]),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      topics[index],
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
