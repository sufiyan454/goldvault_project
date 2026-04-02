import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'upload_emirates_screen.dart';
import 'upload_passport_screen.dart';

class KycVerificationScreen extends StatelessWidget {
  const KycVerificationScreen({super.key, required String type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "KYC Verification",
          style: TextStyle(
            color: Color.fromARGB(255, 189, 131, 43),
            fontWeight: FontWeight.bold //
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
            const Icon(Icons.arrow_back, color: Colors.black),
            centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

           
            const Text(
              "Document Validation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            
            const Text(
              "Please complete the Personal Verification by submitting one photo ID and one proof of address. Validating these documents ensures that Goldvault+ has verified your identity.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

          
            docButton(context, "Emirates ID"),

            const SizedBox(height: 15),

          
            docButton(context, "Passport ID"),

            const SizedBox(height: 30),

            
            const Text(
              "Instruction",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            const Text(
                "• File must be JPG, JPEG, PNG or PDF (max 2.5 MB)"),
            const Text(
                "• Take a picture of the document (no scanned copy)"),
            const Text("• Select correct document type"),
            const Text(
                "• Fake documents will result in suspension"),
          ],
        ),
      ),
    );
  }

  Widget docButton(BuildContext context, String title) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEAD9B5),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          if (title == "Emirates ID") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const UploadEmiratesScreen(type: '',),
              ),
            );
          } else if (title == "Passport ID") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const UploadPassportScreen(type: '',),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.black87)),
            const Icon(Icons.arrow_forward, color: Colors.black87),
          ],
        ),
      ),
    );
  }
}