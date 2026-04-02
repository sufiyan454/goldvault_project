import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'kyc_success_screen.dart';

class KycVerificationLoadingScreen extends StatefulWidget {
  const KycVerificationLoadingScreen({super.key, required String type});

  @override
  State<KycVerificationLoadingScreen> createState() =>
      _KycVerificationLoadingScreenState();
}

class _KycVerificationLoadingScreenState
    extends State<KycVerificationLoadingScreen> {

  @override
  void initState() {
    super.initState();

    
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const KycSuccessScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.green,
            ),
            SizedBox(height: 20),

            Text(
              "KYC Verification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "To ensure the security of your account and comply with regulatory requirements, we need to verify your identity.\n\nYou will be done in 24 hours!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),

            SizedBox(height: 20),

           
            SizedBox(
              width: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFBD832B),
                  borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}