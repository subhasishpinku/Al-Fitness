import 'dart:async';
import 'package:aifitness/res/widgets/dashboard.dart';
import 'package:aifitness/viewModel/signin_twentyfive_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreenTwentyFive extends StatefulWidget {
  const SigninScreenTwentyFive({super.key});

  @override
  State<SigninScreenTwentyFive> createState() => _SigninScreenTwentyFiveState();
}

class _SigninScreenTwentyFiveState extends State<SigninScreenTwentyFive> {
  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    final viewModel = context.read<SigninTwentyFiveViewModel>();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (viewModel.progress >= 100) {
        timer.cancel();

        /// Delay navigation slightly for a smooth transition
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
        });
      } else {
        viewModel.setProgress(viewModel.progress + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<SigninTwentyFiveViewModel>().progress;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Generating your personal plan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
                Text(
                  "${progress.toInt()}%",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Analyzing your profile...",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
