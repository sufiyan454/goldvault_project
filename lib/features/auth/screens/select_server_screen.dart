import 'package:demofile/features/auth/screens/proof_identify_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SelectServerScreen extends StatefulWidget {
  const SelectServerScreen({super.key});

  @override
  State<SelectServerScreen> createState() =>
      _SelectServerScreenState();
}

class _SelectServerScreenState
    extends State<SelectServerScreen> {

  final List<Map<String, String>> servers = [
    {"name": "Aksara Jewellers", "sub": "Aksarajewellers"},
    {"name": "Arista Gold & Jewellery", "sub": "Aristagold"},
    {"name": "Bhima Gold", "sub": "Bhimagold"},
    {"name": "Joyalukkas", "sub": "Joyalukkas"},
    {"name": "Chemmanur Jewellers", "sub": "Chemmanur"},
    {"name": "Tanishq", "sub": "Tanishq"},
    {"name": "Nakshatra Jewels", "sub": "Nakshatrajewels"},
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    List filtered = servers
        .where((e) => e["name"]!
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Select Server",
          style: TextStyle(color: Color(0xFFBD832B),
          fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
            const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

      
            Container(
              height: 45,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                onChanged: (val) {
                  setState(() => query = val);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search Server",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1),
                itemBuilder: (_, index) {
                  final item = filtered[index];

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const ProofIdentityScreen(),
                        ),
                      );
                    },

                  
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Text(item["name"]![0]),
                    ),

                    
                    title: Text(
                      item["name"]!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500),
                    ),

                  
                    subtitle: Text(item["sub"]!),

                    trailing: const Icon(
                      Icons.info_outline,
                      color: AppColors.gold,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}