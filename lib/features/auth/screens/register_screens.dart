import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  String country = "Select Country";
  String code = "+971";

  bool isChecked = false; 

  bool get isValid =>
      country != "Select Country" &&
      phoneController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      isChecked;

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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// LOGO
              const Icon(Icons.shield,
                  color: AppColors.gold, size: 50),

              const SizedBox(height: 10),

              const Text(
                "GOLD VAULT+",
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              /// TITLE
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              /// COUNTRY
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Country *"),
              ),
              const SizedBox(height: 8),
              inputBox(
                child: DropdownButton<String>(
                  value: country,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ["Select Country", "UAE", "India"]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() => country = val!);
                  },
                ),
              ),

              const SizedBox(height: 16),

              /// PHONE
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Phone Number *"),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  /// CODE
                  Expanded(
                    flex: 2,
                    child: inputBox(
                      child: DropdownButton<String>(
                        value: code,
                        underline: const SizedBox(),
                        items: ["+971", "+91"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => code = val!);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// NUMBER
                  Expanded(
                    flex: 4,
                    child: inputBox(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (_) => setState(() {}),
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

              /// EMAIL
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email *"),
              ),
              const SizedBox(height: 8),
              inputBox(
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) => setState(() {}),
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// PRIVACY
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
                    value: isChecked,
                    activeColor: AppColors.gold,
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          isChecked = val;
                        });
                      }
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

              const Spacer(),

              
              CustomButton(
                text: "Proceed",
            
                enabled: isValid,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OtpScreen(
                        phone: phoneController.text,
                        email: emailController.text,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}