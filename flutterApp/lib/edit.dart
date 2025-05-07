import 'package:flutter/material.dart';
import 'OrderDetails.dart';
//import 'OrderDetailsScreen.dart'; // Import the model

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  bool isDefaultAddress = false;
  String? selectedCity;
  String? selectedState;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  List<String> cities = ["Jaipur", "Mumbai", "Delhi"];
  List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "MadhyaPradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Edit Address",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(fullNameController, "Full Name*"),
            const SizedBox(height: 12),
            _buildTextField(mobileNumberController, "Mobile Number*",
                keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            _buildTextField(pincodeController, "Pincode*",
                keyboardType: TextInputType.number),
            const SizedBox(height: 12),
            _buildTextField(addressController, "Address*"),
            const SizedBox(height: 12),
            _buildTextField(landmarkController, "Landmark*"),
            const SizedBox(height: 12),
            _buildDropdown(cities, selectedCity, "City*", (value) {
              setState(() {
                selectedCity = value;
              });
            }),
            const SizedBox(height: 12),
            _buildDropdown(states, selectedState, "State*", (value) {
              setState(() {
                selectedState = value;
              });
            }),
            const SizedBox(height: 12),
            _buildDefaultCheckbox(),
            const SizedBox(height: 20),
            _buildUseAddressButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String? selectedItem, String hint,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  Widget _buildDefaultCheckbox() {
    return CheckboxListTile(
      value: isDefaultAddress,
      onChanged: (value) {
        setState(() {
          isDefaultAddress = value!;
        });
      },
      title: const Text("Make this my default address"),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _buildUseAddressButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A1A2E),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: _saveAddress,
      child: const Text("Use this Address"),
    );
  }

  void _saveAddress() {
    if (_isFormValid()) {
      final newAddress = ShippingAddress(
        name: fullNameController.text,
        addressLine1: addressController.text,
        addressLine2: landmarkController.text,
        city: selectedCity!,
        state: selectedState!,
        pincode: pincodeController.text,
      );

      Navigator.pop(context, newAddress);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
    }
  }

  bool _isFormValid() {
    return fullNameController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        landmarkController.text.isNotEmpty &&
        selectedCity != null &&
        selectedState != null;
  }
}
