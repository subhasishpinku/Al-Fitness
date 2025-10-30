import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BodyImageProgressViewModel extends ChangeNotifier {
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  List<File> get images => _images;

  /// Open gallery to pick image
  Future<void> addImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, // compress a bit
      );

      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  /// Remove selected image
  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }
}
