import 'package:demofile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'verify_documents_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController dob = TextEditingController();

  String gender = "Male";
  String nationality = "India";
  String residence = "UAE";
  String birthCountry = "India";

  /// VALIDATION (SAFE)
  bool get isValid {
    return firstName.text.trim().isNotEmpty &&
        dob.text.trim().isNotEmpty &&
        nationality.isNotEmpty &&
        birthCountry.isNotEmpty;
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dob.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Widget inputField(
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
        onChanged: (_) => setState(() {}),
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
  void dispose() {
    firstName.dispose();
    surname.dispose();
    dob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    inputField(firstName, "Enter first name"),

                    const SizedBox(height: 16),

                    const Text("Surname"),
                    const SizedBox(height: 8),
                    inputField(surname, "Enter surname"),

                    const SizedBox(height: 16),

                    const Text("Date of Birth *"),
                    const SizedBox(height: 8),
                    inputField(
                      dob,
                      "Select date",
                      readOnly: true,
                      onTap: pickDate,
                    ),

                    const SizedBox(height: 16),

                    const Text("Gender *"),
                    const SizedBox(height: 8),
                    dropdown(
                      value: gender,
                      items: ["Male", "Female"],
                      onChanged: (val) => setState(() => gender = val!),
                    ),

                    const SizedBox(height: 16),

                    const Text("Nationality *"),
                    const SizedBox(height: 8),
                    dropdown(
                      value: nationality,
                      items: ["India", "UAE"],
                      onChanged: (val) => setState(() => nationality = val!),
                    ),

                    const SizedBox(height: 16),

                    const Text("Country of Residence *"),
                    const SizedBox(height: 8),
                    dropdown(
                      value: residence,
                      items: ["UAE", "India"],
                      onChanged: (val) => setState(() => residence = val!),
                    ),
                    SizedBox(height: 16),
                    Text("Country of Birth *"),

                    const SizedBox(height: 8),
                    dropdown(
                      value: birthCountry,
                      items: ["India", "UAE"],
                      onChanged: (val) => setState(() => birthCountry = val!),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SizedBox(height: 17),

              CustomButton(
                text: "Proceed",
                enabled: isValid,
                onTap: () {
                  if (!isValid) return;

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
