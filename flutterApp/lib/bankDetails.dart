import 'package:flutter/material.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

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
          'Bank Details',
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
            const Text(
              'Verification in progress. We will notify you once we have verified your details',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF102A41),
              ),
            ),
            const SizedBox(height: 24),
            _buildBankDetailItem(
                'Beneficiary Name', 'Kumar sanjay vinod kumar singh'),
            const SizedBox(height: 16),
            _buildBankDetailItem('Account Number', '6648777632'),
            const SizedBox(height: 16),
            _buildBankDetailItem('Bank Name', 'Kotak Mahindra Bank Limited'),
            const SizedBox(height: 16),
            _buildBankDetailItem('IFSC Code', 'KKBK0001422'),
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

  Widget _buildBankDetailItem(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 8, color: Colors.teal),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF102A41),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4A4A4A),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
