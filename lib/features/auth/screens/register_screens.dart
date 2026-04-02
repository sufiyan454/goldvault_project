import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../providers/auth_provider.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  Widget inputBox({required Widget child}) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gold),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
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
                  children: [
                    // TOP CONTENT
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        const Icon(Icons.shield, color: AppColors.gold, size: 50),
                        const SizedBox(height: 10),
                        const Text(
                          "GOLD VAULT+",
                          style: TextStyle(
                            color: AppColors.gold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Country *"),
                        ),
                        const SizedBox(height: 8),
                        inputBox(
                          child: DropdownButton<String>(
                            value: authProvider.country,
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: ["Select Country", "UAE", "India"]
                                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (val) {
                              if (val != null) authProvider.setCountry(val);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Phone Number *"),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: inputBox(
                                child: DropdownButton<String>(
                                  value: authProvider.code,
                                  underline: const SizedBox(),
                                  items: ["+971", "+91"]
                                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                      .toList(),
                                  onChanged: (val) {
                                    if (val != null) authProvider.setCode(val);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 4,
                              child: inputBox(
                                child: TextField(
                                  controller: authProvider.phoneController,
                                  keyboardType: TextInputType.phone,
                                  onChanged: (_) => authProvider.notifyInputChanges(),
                                  decoration: const InputDecoration(
                                    hintText: "Enter phone number",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email *"),
                        ),
                        const SizedBox(height: 8),
                        inputBox(
                          child: TextField(
                            controller: authProvider.emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (_) => authProvider.notifyInputChanges(),
                            decoration: const InputDecoration(
                              hintText: "Enter email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Privacy Policy:",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "We value your privacy. Our app collects only the essential information needed to provide a smooth and secure experience.",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Checkbox(
                              value: authProvider.isChecked,
                              activeColor: AppColors.gold,
                              onChanged: (val) {
                                if (val != null) authProvider.setChecked(val);
                              },
                            ),
                            const Expanded(
                              child: Text(
                                "By Signing up, you agree to the Terms of Service and Privacy Policy",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // BOTTOM CONTENT
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CustomButton(
                        text: "Proceed",
                        enabled: authProvider.isRegisterValid,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          context.read<AuthProvider>().startTimer();
                          
                          Future.delayed(const Duration(milliseconds: 100), () {
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const OtpScreen(),
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