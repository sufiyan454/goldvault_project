import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'kyc_verification_screen.dart';

class UploadEmiratesScreen extends StatelessWidget {
  const UploadEmiratesScreen({super.key, required String type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Upload Emirates ID",
          style: TextStyle(
           color: Color(0xFFBD832B),
            fontWeight: FontWeight.bold 
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            const SizedBox(height: 30),

           
            Image.asset(
              "assets/images/emiratesid.png",
              height: 360,
              width: double.infinity,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            /// SUCCESS ICON
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),

            const SizedBox(height: 140),

            const Text(
              "Retake Photo",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),

            const Spacer(),

            
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFFBD832B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const KycVerificationScreen(type: '',),
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