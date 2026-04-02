import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

import 'login_otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  bool get isValid => phoneController.text.trim().length >= 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Icon(Icons.shield, size: 50, color: AppColors.gold),

              const SizedBox(height: 10),

              const Text(
                "GOLD VAULT+",
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              /// TITLE
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 20),

              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gold),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,

                  onChanged: (_) => setState(() {}),

                  decoration: const InputDecoration(
                    hintText: "Enter Mobile Number",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Text(
                    "By Proceeding you agree to Univest's",

                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  SizedBox(width: 2),
                  RichText(
                    text: TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 192, 180, 70),
                        fontSize: 11,
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    'and',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  SizedBox(width: 2),
                  RichText(
                    text: TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 204, 192, 81),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "Get OTP",
                enabled: isValid,
                onTap: () {
                  print("OTP CLICKED");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          LoginOtpScreen(phone: phoneController.text),
                    ),
                  );
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
