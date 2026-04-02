import 'package:flutter/material.dart';

class UploadProvider extends ChangeNotifier {
  bool frontUploaded = false;
  bool backUploaded = false;

  bool get isValid => frontUploaded && backUploaded;

  void uploadFront() {
    frontUploaded = true;
    notifyListeners();
  }

  void uploadBack() {
    backUploaded = true;
    notifyListeners();
  }

  void reset() {
    frontUploaded = false;
    backUploaded = false;
    notifyListeners();
  }
}
