import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  String? _selectedOption;

  final List<String> _options = [
    'UPI / Net Banking',
    'Debit/Credit/ATM Cards',
    'EMI',
    'Pay on Delivery',
  ];

  void _onContinuePressed() {
    if (_selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a payment method')),
      );
    } else {
      // Simulate UPI logic
      if (_selectedOption == 'UPI / Net Banking') {
        debugPrint('Proceeding with UPI payment...');
        // Integrate your UPI logic or redirect here
      }

      // You can navigate to a new screen or show confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected: $_selectedOption')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Payment Options',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'More way to pay',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            ..._options.map((option) => _buildPaymentOption(option)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onContinuePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: RadioListTile<String>(
        value: label,
        groupValue: _selectedOption,
        activeColor: Colors.black,
        onChanged: (value) {
          setState(() {
            _selectedOption = value;
          });
        },
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
