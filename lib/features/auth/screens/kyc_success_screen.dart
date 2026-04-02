import 'package:demofile/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class KycSuccessScreen extends StatelessWidget {
  const KycSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 70,
              ),

              const SizedBox(height: 20),

              const Text(
                "Your KYC Successfully Verified",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Congratulations! Your ID verification was successful and now you can fully access our services.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              
              GestureDetector(
                onTap: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const LoginScreen(),
                      ),
                    );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 151, 56),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}