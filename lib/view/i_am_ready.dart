import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_fourth_appBar.dart';
import 'package:aifitness/viewModel/i_am_ready_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IamReady extends StatefulWidget {
  const IamReady({super.key});

  @override
  State<IamReady> createState() => _IamReadyState();
}

class _IamReadyState extends State<IamReady> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IamReadyViewModel(),
      child: Consumer<IamReadyViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: const SigninFourthAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- SET 1 ----------
                  _buildSetCard(
                    title: "Set 1 - Warm-Up Set",
                    description:
                        "For the warm-up set, increase your warm-up set weight by 5–10% from your current equipment. Use a weight that allows you to complete 10 reps comfortably while maintaining proper form. This prepares your muscles and joints for the heavier sets ahead.",
                  ),
                  const SizedBox(height: 16),

                  // ---------- SET 2 ----------
                  _buildSetCard(
                    title: "Set 2 - Failure Set",
                    description:
                        "For the failure set, if you can complete 10 reps, increase the weight by 5–8% from your current equipment so that you can do around 5 reps. If you are not able to reach 10 reps yet, continue with the same weight until you can complete all 10 reps.",
                  ),
                  const SizedBox(height: 16),

                  // ---------- SET 3 ----------
                  _buildSetCard(
                    title: "Set 3 - Working Set (Pump Set)",
                    description:
                        "For the working or pump set, choose a weight that challenges you to perform 10 reps with proper form. You should feel the effort without compromising technique. The goal is to progressively overload your muscles each week by increasing your equipment weight 5–10% from the current equipment weight.",
                  ),
                  const SizedBox(height: 24),

                  // ---------- Buttons ----------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Track Progress Button
                      OutlinedButton(
                        onPressed: () {
                          viewModel.onTrackProgress(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          "Track Progress",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // I'm Ready Button
                      ElevatedButton(
                        onPressed: () {
                          viewModel.onReady(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          "I'm Ready",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------- Helper Widget ----------
  Widget _buildSetCard({required String title, required String description}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14.5,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
