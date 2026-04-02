import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

import 'select_server_screen.dart';

class LoginOtpScreen extends StatefulWidget {
  final String phone;

  const LoginOtpScreen({super.key, required this.phone});

  @override
  State<LoginOtpScreen> createState() =>
      _LoginOtpScreenState();
}

class _LoginOtpScreenState
    extends State<LoginOtpScreen> {

  List<String> otp = ["", "", "", ""];
  int index = 0;

  bool get isValid => otp.every((e) => e.isNotEmpty);

  void addNumber(String value) {
    if (index < 4) {
      setState(() {
        otp[index] = value;
        index++;
      });
    }
  }

  void deleteNumber() {
    if (index > 0) {
      setState(() {
        index--;
        otp[index] = "";
      });
    }
  }

  Widget otpBox(String value) {
    return Container(
      width: 65,
      height: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }

  Widget key(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String masked =
        "*******${widget.phone.substring(widget.phone.length - 2)}";

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const SizedBox(height: 10),

           
            const Text(
              "OTP Verification",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

           
            Text(
              masked,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 5),

            const Text(
              "OTP Sent to the above number",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: otp.map((e) => otpBox(e)).toList(),
            ),

            const SizedBox(height: 15),

            /// RESEND
            const Text.rich(
              TextSpan(
                text: "Didn't receive the OTP ",
                children: [
                  TextSpan(
                    text: "Resend OTP",
                    style: TextStyle(
                      color: AppColors.gold,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            if (isValid)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: "Verify",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const SelectServerScreen(),
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[300],
              child: GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: 12,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (_, i) {
                  List keys = [
                    "1","2","3",
                    "4","5","6",
                    "7","8","9",
                    "+ * #","0","⌫"
                  ];

                  String keyText = keys[i];

                  return key(
                    keyText,
                    onTap: () {
                      if (keyText == "⌫") {
                        deleteNumber();
                      } else if (keyText != "+ * #") {
                        addNumber(keyText);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}