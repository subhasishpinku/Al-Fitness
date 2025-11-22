import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_fourth_appBar.dart';
import 'package:aifitness/viewModel/video_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoViewModel(),
      child: Consumer<VideoViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: const SigninFourthAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicWidth(
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
                              side: BorderSide(
                                color: AppColors.backgroundColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: AppColors.primaryColor,
                              backgroundColor: AppColors.signInButtonColor,
                            ),
                            onPressed: () {},
                            child: Text(
                              "First1, you need to do a warm-up to loosen your muscles. "
                              "Please tap the link below and follow the video.",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Video Placeholder ---
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full-Body Warm-Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 160,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.black54,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // --- Bottom Instruction ---
                  IntrinsicWidth(
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
                              side: BorderSide(
                                color: AppColors.backgroundColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: AppColors.primaryColor,
                              backgroundColor: AppColors.signInButtonColor,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Click the 'Complete' button when you're done with the warm-up. "
                              "I'll then give you your main .exercise",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                  const Spacer(),

                  // --- Complete Button ---
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.onComplete(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        child: Text(
                          "Complete",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
