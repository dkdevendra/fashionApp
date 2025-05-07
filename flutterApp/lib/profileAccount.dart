import 'package:flutter/material.dart';
import 'package:helloworld/ligalAndPolicies.dart';
import 'package:helloworld/settings.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreen();
}

class _AccountScreen extends State<AccountScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF8F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.account_box_outlined, size: 40),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: Aman Singh',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('user1234@gmail.com'),
                    ],
                  ),
                ],
              ),
            ),
            _buildOptionTile(
              Icons.headset_mic,
              'Help Center',
              const SettingsScreen(),
            ),
            _buildOptionTile(Icons.account_balance_wallet, 'Bank & UPI Details',
                const SettingsScreen()),
            _buildOptionTile(
                Icons.share, 'Shared Products', const SettingsScreen()),
            _buildOptionTile(
                Icons.store, 'View Products', const SettingsScreen()),
            _buildOptionTile(Icons.payment, 'Payments', const SettingsScreen()),
            _buildOptionTile(Icons.business_center, 'Become a Supplier',
                const SettingsScreen()),
            _buildOptionTile(
                Icons.star_border, 'Rate Us', const SettingsScreen()),
            _buildOptionTile(
                Icons.settings, 'Settings', const SettingsScreen()),
            _buildOptionTile(Icons.policy, 'Legal and Policies',
                const LegalPoliciesScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, Widget screen1) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen1),
          );
          // Add your navigation or logic here
        },
      ),
    );
  }
}
