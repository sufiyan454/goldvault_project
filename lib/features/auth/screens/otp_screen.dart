import 'dart:async';
import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

import 'profile_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  final String email;

  const OtpScreen({
    super.key,
    required this.phone,
    required this.email,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> emailOtp =
      List.generate(4, (_) => TextEditingController());

  final List<TextEditingController> phoneOtp =
      List.generate(4, (_) => TextEditingController());

  int seconds = 45;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  bool get isValid =>
      emailOtp.every((c) => c.text.isNotEmpty) &&
      phoneOtp.every((c) => c.text.isNotEmpty);

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget otpRow(List<TextEditingController> list) {
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
            onChanged: (_) => setState(() {}),
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
              "Sent to ${widget.email} and ${widget.phone}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            
            const Text("Enter Email OTP *"),
            const SizedBox(height: 10),
            otpRow(emailOtp),

            const SizedBox(height: 10),
            Text(
              "Resend in 0:${seconds.toString().padLeft(2, '0')}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const Text("Enter Whatsapp OTP *"),
            const SizedBox(height: 10),
            otpRow(phoneOtp),

            const SizedBox(height: 10),
            Text(
              "Resend in 0:${seconds.toString().padLeft(2, '0')}",
              style: const TextStyle(color: Colors.grey),
            ),

            const Spacer(),

            CustomButton(
              text: "Proceed",
              enabled: isValid,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}