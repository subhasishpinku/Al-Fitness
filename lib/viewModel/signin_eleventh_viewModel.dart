import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// Save selected body fat percentage
  Future<void> selectIndex(int index) async {
    selectedIndex = index;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final percentage = bodyFatImages[index]['percentage'].toString();

    await prefs.setString('current_bfp', percentage);

    final savedBfp = prefs.getString('current_bfp');
    print('Saved current_bfp: $savedBfp');
  }

  /// Placeholder for manual input feature
  void enterManually(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Manual input coming soon")));
  }
}
