import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../providers/auth_provider.dart';
import 'login_otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                      
                      const SizedBox(height: 60), // Replaced Spacer
                      
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
                          controller: authProvider.phoneController,
                          keyboardType: TextInputType.phone,
                          onChanged: (_) => authProvider.notifyInputChanges(),
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
                          const SizedBox(width: 2),
                          RichText(
                            text: const TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                color: Color.fromARGB(255, 192, 180, 70),
                                fontSize: 11,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'and',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          const SizedBox(width: 2),
                          RichText(
                            text: const TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Color.fromARGB(255, 204, 192, 81),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              
              // Bottom sticky section
              CustomButton(
                text: "Get OTP",
                enabled: authProvider.isLoginValid,
                onTap: () {
                  context.read<AuthProvider>().resetLoginOtp();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginOtpScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
