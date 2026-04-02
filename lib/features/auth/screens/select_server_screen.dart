import 'package:demofile/features/auth/screens/proof_identify_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../providers/server_provider.dart';

class SelectServerScreen extends StatelessWidget {
  const SelectServerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serverProvider = context.watch<ServerProvider>();
    final filtered = serverProvider.filteredServers;

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
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                onChanged: serverProvider.updateQuery,
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
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, index) {
                  final item = filtered[index];

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProofIdentityScreen(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Text(item["name"]![0]),
                    ),
                    title: Text(
                      item["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
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