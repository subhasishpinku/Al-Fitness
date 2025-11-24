import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninTwelveViewModel extends ChangeNotifier {
  int? _selectedIndex;

  final List<Map<String, String>> bodyFatList = [
  {'percent': '9%', 'image': 'assets/images/Desired/9.png'},
  {'percent': '11%', 'image': 'assets/images/Desired/11.png'},
  {'percent': '13%', 'image': 'assets/images/Desired/13.png'},
  {'percent': '15%', 'image': 'assets/images/Desired/15.png'},
  {'percent': '17%', 'image': 'assets/images/Desired/17.png'},
  {'percent': '19%', 'image': 'assets/images/Desired/19.png'},
  {'percent': '21%', 'image': 'assets/images/Desired/21.png'},
  {'percent': '23%', 'image': 'assets/images/Desired/23.png'},
  {'percent': '25%', 'image': 'assets/images/Desired/25.png'},
];


  int? get selectedIndex => _selectedIndex;

  Future<void> selectIndex(int index) async {
    _selectedIndex = index;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final percentage = bodyFatList[index]['percent']!;

    await prefs.setString('target_bfp', percentage);
    debugPrint('Saved target_bfp: $percentage');
  }
}
