import 'package:demofile/features/auth/screens/kyc_verification_loading_screen.dart.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';


class UploadPassportScreen extends StatelessWidget {
  const UploadPassportScreen({super.key, required String type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Upload Passport ID",
          style: TextStyle(
            color: Color(0xFFBD832B),
            fontWeight: FontWeight.bold 
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            const SizedBox(height: 30),

            Image.asset(
              "assets/images/passportid.png",
              
              height: 380,
              width: double.infinity,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),

            const SizedBox(height: 200),

            Text(
              "Retake Photo",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),

            const Spacer(),

            
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SizedBox(
                width: 400,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBD832B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const KycVerificationLoadingScreen(type: '',),
                      ),
                    );
                  },
                  child: const Text(
                    "Upload Photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}