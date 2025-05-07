import 'package:flutter/material.dart';
import 'package:helloworld/paymentOptions.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Payment Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _infoCard('Payment Method', 'BHIM UPI'),
            const SizedBox(height: 12),
            _infoCard('Billing Address:', '''
8/41 Chitrakoot
Near SBI Bank Vashali Nagar,
Jaipur,
Rajasthan
302021'''),
            const SizedBox(height: 12),
            _infoCard('Shipping Address:', '''
Pawan Kumar
8/41 Chitrakoot
Near SBI Bank Vashali Nagar,
Jaipur,
Rajasthan
302021'''),
            const SizedBox(height: 12),
            _priceSummary(),
            const Spacer(),
            _bottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RichText(
        text: TextSpan(
          text: '$title\n',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: content,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _priceSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          _priceRow('Items:', '₹350.00'),
          _priceRow('Postage & Packing:', '₹00.00'),
          _priceRow('Total Before Tax:', '₹00.00'),
          _priceRow('Tax:', '₹00.00'),
          Divider(),
          _priceRow('Total:', '₹350.00', isBold: true),
        ],
      ),
    );
  }

  Widget _bottomButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PaymentOptionsScreen()),
          );
          // Add your button logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A1A2E),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('Continue', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class _priceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _priceRow(this.label, this.value, {this.isBold = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
