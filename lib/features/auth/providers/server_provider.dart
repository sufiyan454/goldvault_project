import 'package:flutter/material.dart';

class ServerProvider extends ChangeNotifier {
  final List<Map<String, String>> servers = [
    {"name": "Aksara Jewellers", "sub": "Aksarajewellers"},
    {"name": "Arista Gold & Jewellery", "sub": "Aristagold"},
    {"name": "Bhima Gold", "sub": "Bhimagold"},
    {"name": "Joyalukkas", "sub": "Joyalukkas"},
    {"name": "Chemmanur Jewellers", "sub": "Chemmanur"},
    {"name": "Tanishq", "sub": "Tanishq"},
    {"name": "Nakshatra Jewels", "sub": "Nakshatrajewels"},
  ];

  String _query = "";

  String get query => _query;

  void updateQuery(String value) {
    _query = value;
    notifyListeners();
  }

  List<Map<String, String>> get filteredServers {
    if (_query.isEmpty) return servers;
    return servers
        .where((e) => e["name"]!.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }
}
