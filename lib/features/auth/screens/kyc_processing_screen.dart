import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../auth/screens/login_screen.dart';

class KycProcessingScreen extends StatefulWidget {
  const KycProcessingScreen({super.key});

  @override
  State<KycProcessingScreen> createState() =>
      _KycProcessingScreenState();
}

class _KycProcessingScreenState
    extends State<KycProcessingScreen> {

  @override
  void initState() {
    super.initState();

   
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.gold,
            ),
            SizedBox(height: 20),
            Text(
              "Verifying Details",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}