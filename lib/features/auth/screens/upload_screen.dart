import 'package:demofile/features/auth/screens/kyc_processing_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class UploadScreen extends StatefulWidget {
  final String type; // Passport / Emirates ID

  const UploadScreen({super.key, required this.type});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool frontUploaded = false;
  bool backUploaded = false;

 
  void showPicker(bool isFront) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          height: 160,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pickerItem(Icons.camera_alt, "Camera", isFront),
              pickerItem(Icons.image, "Gallery", isFront),
            ],
          ),
        );
      },
    );
  }

  
  Widget pickerItem(IconData icon, String text, bool isFront) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);

        setState(() {
          if (isFront) {
            frontUploaded = true;
          } else {
            backUploaded = true;
          }
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }

  
  Widget uploadBox(String title, bool uploaded, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(color: uploaded ? AppColors.gold : Colors.black26),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              uploaded ? Icons.check_circle : Icons.upload,
              color: uploaded ? Colors.green : Colors.black54,
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  bool get isValid => frontUploaded && backUploaded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Upload ${widget.type}"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Text(
              "Upload ${widget.type}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 5),

            const Text(
              "Follow the guidelines and proceed",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            uploadBox(
              "Front Image (Slide with face)",
              frontUploaded,
              () => showPicker(true),
            ),

            
            uploadBox("Back Image", backUploaded, () => showPicker(false)),

            const SizedBox(height: 20),

           
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.crop_free, color: AppColors.gold),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Capture the whole document, all 4 corners must be visible",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.visibility_off, color: AppColors.gold),
                SizedBox(width: 10),
                Expanded(child: Text("Avoid glare, reflection and shadows.")),
              ],
            ),

            const Spacer(),

            GestureDetector(
              onTap: isValid
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const KycProcessingScreen(),
                        ),
                      );
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: isValid ? AppColors.gold : Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),

                alignment: Alignment.center,
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
