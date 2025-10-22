import 'package:flutter/material.dart';

class SigninEleventhViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> bodyFatImages = [
    {'image': 'assets/images/body_shape_1.png', 'percentage': 40},
    {'image': 'assets/images/body_shape_2.png', 'percentage': 37},
    {'image': 'assets/images/body_shape_3.png', 'percentage': 33},
    {'image': 'assets/images/body_shape_4.png', 'percentage': 30},
    {'image': 'assets/images/body_shape_5.png', 'percentage': 27},
    {'image': 'assets/images/body_shape_6.png', 'percentage': 24},

    {'image': 'assets/images/body_21.png', 'percentage': 21},
    {'image': 'assets/images/body_18.png', 'percentage': 18},
    {'image': 'assets/images/body_15.png', 'percentage': 15},
  ];

  double? selectedFat;

  void selectFat(double value) {
    selectedFat = value;
    notifyListeners();
  }

  void enterManually(BuildContext context) {
    // You can add navigation to a text input page
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Manual input coming soon")));
  }
}
