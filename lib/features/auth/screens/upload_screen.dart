import 'package:demofile/features/auth/screens/kyc_processing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../providers/upload_provider.dart';

class UploadScreen extends StatelessWidget {
  final String type;

  const UploadScreen({super.key, required this.type});

  void showPicker(BuildContext context, UploadProvider provider, bool isFront) {
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
              pickerItem(context, provider, Icons.camera_alt, "Camera", isFront),
              pickerItem(context, provider, Icons.image, "Gallery", isFront),
            ],
          ),
        );
      },
    );
  }

  Widget pickerItem(BuildContext context, UploadProvider provider, IconData icon, String text, bool isFront) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        if (isFront) {
          provider.uploadFront();
        } else {
          provider.uploadBack();
        }
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

  @override
  Widget build(BuildContext context) {
    final uploadProvider = context.watch<UploadProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("KYC",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Column(
                      children: [
                        Text(
                          "Upload Passport",
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
                          uploadProvider.frontUploaded,
                          () => showPicker(context, uploadProvider, true),
                        ),
                        
                        uploadBox(
                          "Back Image",
                          uploadProvider.backUploaded,
                           () => showPicker(context, uploadProvider, false),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 500),
                    child: Column(
                      children: [
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
                        const SizedBox(height: 30),
                    
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.visibility_off, color: AppColors.gold),
                            SizedBox(width: 10),
                            Expanded(child: Text("Avoid glare, reflection and shadows.")),
                          ],
                        ),
                    
                        Padding(
                          padding: const EdgeInsets.only(top: 360),
                          child: GestureDetector(
                            onTap: uploadProvider.isValid
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
                                color: uploadProvider.isValid ? AppColors.gold : Colors.grey,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
