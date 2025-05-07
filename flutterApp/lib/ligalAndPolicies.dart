import 'package:flutter/material.dart';

class LegalPoliciesScreen extends StatelessWidget {
  const LegalPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> policies = [
      'Anti Phishing Policy',
      'Privacy Policy',
      'Intellectual Property Policy',
      'Anti Phishing Policy',
      'Privacy Policy',
      'Intellectual Property Policy',
      'Anti Phishing Policy',
      'Privacy Policy',
      'Intellectual Property Policy',
      'Anti Phishing Policy',
      'Privacy Policy',
    ];

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
          'Legal & Policies',
          style: TextStyle(
            color: Color(0xFF102A41),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: policies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                // TODO: Handle policy click navigation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Opening ${policies[index]}')),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF102A41)),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      policies[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF102A41),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        size: 18, color: Color(0xFF102A41)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
