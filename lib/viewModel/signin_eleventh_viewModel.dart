import 'package:flutter/material.dart';

class SigninEleventhViewModel extends ChangeNotifier {
  int? selectedIndex;

  final List<Map<String, dynamic>> bodyFatImages = [
    {'image': 'assets/images/body_shape_1.png', 'percentage': 40},
    {'image': 'assets/images/body_shape_2.png', 'percentage': 37},
    {'image': 'assets/images/body_shape_3.png', 'percentage': 33},
    {'image': 'assets/images/body_shape_4.png', 'percentage': 30},
    {'image': 'assets/images/body_shape_5.png', 'percentage': 27},
    {'image': 'assets/images/body_shape_6.png', 'percentage': 24},

    {'image': 'assets/images/body_21.jpeg', 'percentage': 21},
    {'image': 'assets/images/body_18.jpeg', 'percentage': 18},
    {'image': 'assets/images/body_15.jpeg', 'percentage': 15},
  ];

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void enterManually(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Manual input coming soon")));
  }
}
