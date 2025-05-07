import 'package:flutter/material.dart';

class WhatsappNotificationScreen extends StatefulWidget {
  const WhatsappNotificationScreen({super.key});

  @override
  State<WhatsappNotificationScreen> createState() =>
      _WhatsappNotificationScreenState();
}

class _WhatsappNotificationScreenState
    extends State<WhatsappNotificationScreen> {
  final TextEditingController _mobileController = TextEditingController();

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
          'Whatsapp Notifications',
          style: TextStyle(
            color: Color(0xFF102A41),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/whatsapp.jpg', // Make sure you have a whatsapp logo asset or replace with Icon
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Receive Notifications on whatsapp",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF102A41),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  width: 80,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF102A41)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '+91',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF102A41)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF102A41)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement subscribe functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Subscribed Successfully')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF102A41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Subscribe',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
