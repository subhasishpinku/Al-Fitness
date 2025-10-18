import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:aifitness/res/widgets/signin_topic_list.dart';
import 'package:aifitness/viewModel/signin_third_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreenThird extends StatefulWidget {
  const SigninScreenThird({super.key});

  @override
  State<SigninScreenThird> createState() => _SigninScreenThirdState();
}

class _SigninScreenThirdState extends State<SigninScreenThird> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninThirdViewModel>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const SigninSecondAppBar(), //  Use separated AppBar

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Question
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
                          "How fast would you like to \n lose weight?",
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

                const SizedBox(height: 8),
                Text(
                  "Please select a topic below",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 30),

                // Topic list
                Expanded(
                  child: SigninTopicList(
                    topics: provider.topics,
                    isVisible: provider.isVisible,
                    onTopicSelected: provider.onTopicSelected,
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
