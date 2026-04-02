import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../providers/auth_provider.dart';
import 'verify_documents_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> pickDate(BuildContext context, AuthProvider authProvider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      authProvider.dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      authProvider.notifyInputChanges();
    }
  }

  Widget inputField(
    AuthProvider authProvider,
    TextEditingController controller,
    String hint, {
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gold),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: (_) => authProvider.notifyInputChanges(),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: readOnly ? const Icon(Icons.calendar_today) : null,
        ),
      ),
    );
  }

  Widget dropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gold),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: items.contains(value) ? value : items.first,
        isExpanded: true,
        underline: const SizedBox(),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 20),

                    /// TITLE
                    const Text(
                      "Tell us about yourself",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text("First Name *"),
                    const SizedBox(height: 8),
                    inputField(authProvider, authProvider.firstNameController, "Enter first name"),

                    const SizedBox(height: 16),

                    const Text("Surname"),
                    const SizedBox(height: 8),
                    inputField(authProvider, authProvider.surnameController, "Enter surname"),

                    const SizedBox(height: 16),

                    const Text("Date of Birth *"),
                    const SizedBox(height: 8),
                    inputField(
                      authProvider,
                      authProvider.dobController,
                      "Select date",
                      readOnly: true,
                      onTap: () => pickDate(context, authProvider),
                    ),

                    const SizedBox(height: 16),

                    const Text("Gender *"),
                    const SizedBox(height: 8),
                    dropdown(
                      value: authProvider.gender,
                      items: ["Male", "Female"],
                      onChanged: (val) {
                        if (val != null) authProvider.setGender(val);
                      },
                    ),

                    const SizedBox(height: 16),

                    const Text("Nationality *"),
                    const SizedBox(height: 8),
                    dropdown(
                      value: authProvider.nationality,
                      items: ["India", "UAE"],
                      onChanged: (val) {
                        if (val != null) authProvider.setNationality(val);
                      },
                    ),

                    const SizedBox(height: 16),

                    const Text("Country of Residence *"),
                    const SizedBox(height: 8),
                    dropdown(
                      value: authProvider.residence,
                      items: ["UAE", "India"],
                      onChanged: (val) {
                        if (val != null) authProvider.setResidence(val);
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text("Country of Birth *"),

                    const SizedBox(height: 8),
                    dropdown(
                      value: authProvider.birthCountry,
                      items: ["India", "UAE"],
                      onChanged: (val) {
                        if (val != null) authProvider.setBirthCountry(val);
                      },
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 17),

              CustomButton(
                text: "Proceed",
                enabled: authProvider.isProfileValid,
                onTap: () {
                  if (!authProvider.isProfileValid) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerifyDocumentsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
