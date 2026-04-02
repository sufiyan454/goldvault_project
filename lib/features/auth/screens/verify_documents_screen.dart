import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'upload_screen.dart';

class VerifyDocumentsScreen extends StatelessWidget {
  const VerifyDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("KYC"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            
            const Text(
              "Verify Documents",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

          
            const Text(
              "Please take a clear picture with uniform background for the best experience",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            docCard(context, "Passport"),

            const SizedBox(height: 20),

            
            docCard(context, "Emirates ID"),

            const Spacer(),

         
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 189, 131, 43),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget docCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UploadScreen(type: 'title',)
          ),
        );
      },
      child: Container(
        width: double.infinity,

      
        padding: const EdgeInsets.symmetric(vertical: 25),
        margin: const EdgeInsets.symmetric(horizontal: 70),

        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.credit_card, size: 40),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Status: Pending",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}