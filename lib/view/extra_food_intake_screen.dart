import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/viewModel/extra_food_intake_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExtraFoodIntakeScreen extends StatelessWidget {
  const ExtraFoodIntakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExtraFoodIntakeViewModel>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Log Today's Extra Food Intake",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "(If you consumed any extra food today, enter it here to keep your nutrition on track)",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),

              /// Input Box
              TextField(
                controller: viewModel.intakeController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Describe extra food or calories consumed...",
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Submit Button
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
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
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Week 3 Extra Food Intake History",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ),

              /// History Section
              const SizedBox(height: 6),

              if (viewModel.intakeHistory.isEmpty)
                Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "No track record found. You’ll see your track record here after adding one.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    itemCount: viewModel.intakeHistory.length,
                    separatorBuilder: (_, __) => const Divider(height: 8),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          viewModel.intakeHistory[index],
                          style: const TextStyle(fontSize: 13),
                        ),
                        leading: const Icon(
                          Icons.fastfood,
                          color: Colors.black87,
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
