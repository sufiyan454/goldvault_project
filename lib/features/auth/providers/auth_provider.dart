import 'dart:async';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // --- Registration Screen State ---
  String country = "Select Country";
  String code = "+971";
  bool isChecked = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool get isRegisterValid =>
      country != "Select Country" &&
      phoneController.text.trim().isNotEmpty &&
      emailController.text.trim().isNotEmpty &&
      isChecked;

  void setCountry(String val) {
    country = val;
    notifyListeners();
  }

  void setCode(String val) {
    code = val;
    notifyListeners();
  }

  void setChecked(bool val) {
    isChecked = val;
    notifyListeners();
  }

  void notifyInputChanges() {
    notifyListeners();
  }

  // --- Login Screen State ---
  bool get isLoginValid => phoneController.text.trim().length >= 8;

  // --- OTP Screen State ---
  final List<TextEditingController> emailOtp =
      List.generate(4, (_) => TextEditingController());
  final List<TextEditingController> phoneOtp =
      List.generate(4, (_) => TextEditingController());
  int seconds = 45;
  Timer? _timer;

  bool get isOtpValid =>
      emailOtp.every((c) => c.text.isNotEmpty) &&
      phoneOtp.every((c) => c.text.isNotEmpty);

  void startTimer() {
    _timer?.cancel();
    seconds = 45;
    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        seconds--;
        notifyListeners();
      }
    });
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  // --- Login OTP Screen State ---
  List<String> loginOtp = ["", "", "", ""];
  int loginOtpIndex = 0;

  bool get isLoginOtpValid => loginOtp.every((e) => e.isNotEmpty);

  void addLoginOtpNumber(String value) {
    if (loginOtpIndex < 4) {
      loginOtp[loginOtpIndex] = value;
      loginOtpIndex++;
      notifyListeners();
    }
  }

  void deleteLoginOtpNumber() {
    if (loginOtpIndex > 0) {
      loginOtpIndex--;
      loginOtp[loginOtpIndex] = "";
      notifyListeners();
    }
  }

  void resetLoginOtp() {
    loginOtp = ["", "", "", ""];
    loginOtpIndex = 0;
    notifyListeners();
  }

  // --- Profile Screen State ---
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  
  String gender = "Male";
  String nationality = "India";
  String residence = "UAE";
  String birthCountry = "India";

  bool get isProfileValid {
    return firstNameController.text.trim().isNotEmpty &&
        dobController.text.trim().isNotEmpty &&
        nationality.isNotEmpty &&
        birthCountry.isNotEmpty;
  }

  void setGender(String val) {
    gender = val;
    notifyListeners();
  }

  void setNationality(String val) {
    nationality = val;
    notifyListeners();
  }

  void setResidence(String val) {
    residence = val;
    notifyListeners();
  }

  void setBirthCountry(String val) {
    birthCountry = val;
    notifyListeners();
  }
}
