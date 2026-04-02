import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../providers/auth_provider.dart';
import 'profile_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  Widget otpRow(AuthProvider authProvider, List<TextEditingController> list) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (i) {
        return SizedBox(
          width: 60,
          child: TextField(
            controller: list[i],
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (_) => authProvider.notifyInputChanges(),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TOP CONTENT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),

                        const Text(
                          "Enter OTP",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          "Sent to ${authProvider.emailController.text} and ${authProvider.phoneController.text}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 30),

                        const Text("Enter Email OTP *"),
                        const SizedBox(height: 10),
                        otpRow(authProvider, authProvider.emailOtp),

                        const SizedBox(height: 10),
                        Text(
                          "Resend in 0:${authProvider.seconds.toString().padLeft(2, '0')}",
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        const Text("Enter Whatsapp OTP *"),
                        const SizedBox(height: 10),
                        otpRow(authProvider, authProvider.phoneOtp),

                        const SizedBox(height: 10),
                        Text(
                          "Resend in 0:${authProvider.seconds.toString().padLeft(2, '0')}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    // BOTTOM CONTENT
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CustomButton(
                        text: "Proceed",
                        enabled: authProvider.isOtpValid,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          authProvider.disposeTimer();
                          
                          Future.delayed(const Duration(milliseconds: 100), () {
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProfileScreen(),
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}