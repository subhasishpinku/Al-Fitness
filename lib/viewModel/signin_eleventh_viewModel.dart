import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninEleventhViewModel extends ChangeNotifier {
  int? selectedIndex;

 final List<Map<String, dynamic>> bodyFatImages = [
  {'image': 'assets/images/Current/40.png', 'percentage': 40},
  {'image': 'assets/images/Current/37.png', 'percentage': 37},
  {'image': 'assets/images/Current/33.png', 'percentage': 33},
  {'image': 'assets/images/Current/30.png', 'percentage': 30},
  {'image': 'assets/images/Current/27.png', 'percentage': 27},
  {'image': 'assets/images/Current/24.png', 'percentage': 24},
  {'image': 'assets/images/Current/21.png', 'percentage': 21},
  {'image': 'assets/images/Current/18.png', 'percentage': 18},
  {'image': 'assets/images/Current/15.png', 'percentage': 15},
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
