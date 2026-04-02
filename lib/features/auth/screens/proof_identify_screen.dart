import 'package:demofile/features/auth/screens/kyc_verification_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class ProofIdentityScreen extends StatelessWidget {
  const ProofIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Upload Emirates ID",
          style: TextStyle(color: Color(0xFFBD832B)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            
            const Text(
              "Proof of identity",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "In order to complete your registration please upload a copy of your identity with a clear selfie photo to proof the document holder.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const Text(
              "Choose your identity type",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 15),

           GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const KycVerificationScreen(type: "Emirates ID"),
                  ),
                );
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFBD832B),
                  borderRadius: BorderRadius.circular(2),
                ),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Upload Proof Identity",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

        
            GestureDetector(
              onTap: () {
              
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFBD832B),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Take photo with identity",
                      style: TextStyle(
                        color: Color(0xFFBD832B)
                      ),
                    ),
                    Icon(Icons.arrow_forward,
                        color: AppColors.gold),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}