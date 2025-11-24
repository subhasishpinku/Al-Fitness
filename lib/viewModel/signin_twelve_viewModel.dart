import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninTwelveViewModel extends ChangeNotifier {
  int? _selectedIndex;

  final List<Map<String, String>> bodyFatList = [
    {'percent': '9%', 'image': 'assets/images/body_shape_1.png'},
    {'percent': '11%', 'image': 'assets/images/body_shape_2.png'},
    {'percent': '13%', 'image': 'assets/images/body_shape_3.png'},
    {'percent': '15%', 'image': 'assets/images/body_shape_4.png'},
    {'percent': '17%', 'image': 'assets/images/body_shape_5.png'},
    {'percent': '19%', 'image': 'assets/images/body_shape_6.png'},
    {'percent': '21%', 'image': 'assets/images/body_21.jpeg'},
    {'percent': '23%', 'image': 'assets/images/body_18.jpeg'},
    {'percent': '25%', 'image': 'assets/images/body_15.jpeg'},
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
