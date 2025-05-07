import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CompleteAccountDetailsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class CompleteAccountDetailsScreen extends StatefulWidget {
  const CompleteAccountDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CompleteAccountDetailsScreen> createState() =>
      _CompleteAccountDetailsScreenState();
}

class _CompleteAccountDetailsScreenState
    extends State<CompleteAccountDetailsScreen> {
  int selectedTab = 0;
  final List<String> tabTitles = [
    "GST Details",
    "Pickup Address",
    "Bank Details",
    "Supplier Details"
  ];

  // GST
  final TextEditingController gstinController = TextEditingController();

  // Pickup Address
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  // Bank
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();

  // Supplier
  final TextEditingController supplierNameController = TextEditingController();
  final TextEditingController supplierPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Complete Account Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabTitles.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: selectedTab == index
                            ? const Color(0xFFD6F3F3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedTab == index
                              ? Colors.teal
                              : Colors.black26,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _getTabIcon(index),
                            color: selectedTab == index
                                ? Colors.teal
                                : Colors.black54,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tabTitles[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: selectedTab == index
                                  ? Colors.teal
                                  : Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildTabContent()),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Map<String, String> dataToShow = {};

                  switch (selectedTab) {
                    case 0:
                      dataToShow = {'GSTIN': gstinController.text};
                      break;
                    case 1:
                      dataToShow = {
                        'Building': buildingController.text,
                        'Street': streetController.text,
                        'Pincode': pincodeController.text,
                        'City': cityController.text,
                        'State': stateController.text,
                      };
                      break;
                    case 2:
                      dataToShow = {
                        'Bank Name': bankNameController.text,
                        'Account Number': accountNumberController.text,
                        'IFSC': ifscController.text,
                      };
                      break;
                    case 3:
                      dataToShow = {
                        'Supplier Name': supplierNameController.text,
                        'Phone Number': supplierPhoneController.text,
                      };
                      break;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataDisplayScreen(
                        title: tabTitles[selectedTab],
                        data: dataToShow,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text("Continue"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GST number is required to sell',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'Because the Government needs all suppliers to provide their GST number to sell online.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: gstinController,
              decoration: const InputDecoration(
                labelText: "Enter GSTIN",
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            _buildTextField(buildingController, 'Building Number'),
            _buildTextField(streetController, 'Street/Locality'),
            Row(
              children: [
                Expanded(child: _buildTextField(pincodeController, 'Pincode')),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField(cityController, 'City')),
              ],
            ),
            _buildTextField(stateController, 'State'),
          ],
        );
      case 2:
        return Column(
          children: [
            _buildTextField(bankNameController, 'Bank Name'),
            _buildTextField(accountNumberController, 'Account Number'),
            _buildTextField(ifscController, 'IFSC Code'),
          ],
        );
      case 3:
        return Column(
          children: [
            _buildTextField(supplierNameController, 'Supplier Name'),
            _buildTextField(supplierPhoneController, 'Phone Number'),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.receipt_long_outlined;
      case 1:
        return Icons.location_on_outlined;
      case 2:
        return Icons.account_balance_outlined;
      case 3:
        return Icons.storefront_outlined;
      default:
        return Icons.info_outline;
    }
  }
}

class DataDisplayScreen extends StatelessWidget {
  final String title;
  final Map<String, String> data;

  const DataDisplayScreen({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: data.entries.map((entry) {
            return ListTile(
              title: Text(entry.key),
              subtitle: Text(entry.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
