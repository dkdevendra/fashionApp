import 'package:flutter/material.dart';
import 'package:helloworld/EmailNotifications.dart';
import 'package:helloworld/ligalAndPolicies.dart';
import 'package:helloworld/whatsappNotifications.dart';

import 'bankDetails.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // List of setting options
  final List<String> settingsOptions = [
    "Whatsapp Notifications",
    "Bank Details",
    "GSTIN Details",
    "Legal & Policies",
    "Email Notifications",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F4F1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF102A41)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style:
              TextStyle(color: Color(0xFF102A41), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: settingsOptions
              .map((title) => _buildSettingsButton(context, title))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF7F5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF102A41), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Color(0xFF102A41),
        ),
        onTap: () {
          // Navigation based on title
          if (title == "Whatsapp Notifications") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WhatsappNotificationScreen(),
              ),
            );
          } else if (title == "Bank Details") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BankDetailsScreen(),
              ),
            );
          } else if (title == "GSTIN Details") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BankDetailsScreen(), //GSTIN Details
              ),
            );
          } else if (title == "Legal & Policies") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const LegalPoliciesScreen(), // legal & policies
              ),
            );
          } else if (title == "Email Notifications") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const EmailNotificationScreen(), //Email Noifications
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title tapped')),
            );
          }
        },
      ),
    );
  }
}
