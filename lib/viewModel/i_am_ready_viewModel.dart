import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

class IamReadyViewModel extends ChangeNotifier {
  void onTrackProgress(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Opening progress tracker 📊")),
    );

     Navigator.pushNamed(context, RouteNames.iamReadyFinal);
  }

  void onReady(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Let's start your workout! 💪")),
    );

    // Example: Navigator.pushNamed(context, RouteNames.startWorkout);
  }
}
