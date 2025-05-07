import 'package:flutter/material.dart';
import 'EstimatedDeliveryScreen.dart';
import 'edit.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class ShippingAddress {
  String name;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String pincode;

  ShippingAddress({
    required this.name,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.pincode,
  });
}

List<ShippingAddress> addresses = [
  ShippingAddress(
    name: "Pawan Kumar",
    addressLine1: "8/41 Chitrakoot",
    addressLine2: "Near SBI Bank Vaishali Nagar",
    city: "Jaipur",
    state: "Rajasthan",
    pincode: "302021",
  ),
];

int? selectedAddressIndex;

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isAddressSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Order Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_bag, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressSection(),
            const SizedBox(height: 20),
            _buildProductInfoSection(),
            // const SizedBox(height: 20), _buildShippingInfoCard(),
            const SizedBox(height: 20),
            _buildDeliveryEstimateCard(),
            const SizedBox(height: 30),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Shipping Address",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 10),
        Column(
          children: List.generate(addresses.length, (index) {
            final address = addresses[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: selectedAddressIndex == index
                      ? Colors.teal.shade50
                      : Colors.white,
                  border: Border.all(
                    color: selectedAddressIndex == index
                        ? Colors.teal
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(address.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(address.addressLine1),
                          Text(address.addressLine2),
                          Text("${address.city}, ${address.state}"),
                          Text("Pincode: ${address.pincode}"),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Checkbox(
                          value: selectedAddressIndex == index,
                          onChanged: (val) {
                            setState(() {
                              selectedAddressIndex = index;
                            });
                          },
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, size: 18),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditAddressScreen()),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, size: 18),
                              onPressed: () {
                                setState(() {
                                  addresses.removeAt(index);
                                  if (selectedAddressIndex == index) {
                                    selectedAddressIndex = null;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildProductInfoSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          "https://media.istockphoto.com/id/1345634525/photo/young-man-in-blank-oversize-t-shirt-mockup-front-and-back-used-as-design-template-isolated-on.jpg?s=1024x1024&w=is&k=20&c=Vy1QX-lYLbmzLWb3JscgaxoI0srgNEDX_-se5MoH02s=",
          width: 100,
          height: 130,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Crated Hay T-shirt",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Text("4.5 ★ (Reviews)"),
              SizedBox(height: 4),
              Text("₹ 320",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 4),
              Text("Quantity: 1"),
              SizedBox(height: 4),
              Text("Size: 2XL"),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildShippingInfoCard() {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         isAddressSelected = !isAddressSelected;
  //       });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.all(12),
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFD8F2F3),
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: const [
  //                 Text("Shipping Details",
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //                 SizedBox(height: 6),
  //                 Text(
  //                     "Pawan Kumar, 8/41 Chitrakoot, Near SBI Bank, Jaipur, Rajasthan - 302021"),
  //               ],
  //             ),
  //           ),
  //           Checkbox(
  //             value: isAddressSelected,
  //             onChanged: (value) {
  //               setState(() {
  //                 isAddressSelected = value!;
  //               });
  //             },
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDeliveryEstimateCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9F2F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const EstimatedDeliveryScreen()));
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wednesday, 28 December",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    "Estimated Delivery",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A1A2E),
            minimumSize: const Size(double.infinity, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CancelOrderScreen()),
            );
          },
          child: const Text("Cancel Order", style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () async {
            final newAddress = await Navigator.push<ShippingAddress>(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditAddressScreen()),
            );

            if (newAddress != null) {
              setState(() {
                addresses.add(newAddress);
                selectedAddressIndex = addresses.length - 1;
              });
            }
          },
          icon: const Icon(Icons.add),
          label: const Text("Add New Address"),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: selectedAddressIndex != null
              ? () {
                  final selected = addresses[selectedAddressIndex!];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Confirmed: ${selected.name}, ${selected.city}")),
                  );
                }
              : null,
          child: const Text("Confirm Address", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

//class cancel order

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({Key? key}) : super(key: key);

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  String? _selectedReason;

  final List<String> _cancelReasons = [
    'Ordered by mistake',
    'Item not required anymore',
    'Found cheaper elsewhere',
    'Delivery is taking too long',
    'Other',
  ];

  void _onCancelOrder() {
    if (_selectedReason == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a cancellation reason.")),
      );
    } else {
      // Handle cancellation logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Order cancelled for reason: $_selectedReason")),
      );
      // You can also navigate or call backend service here
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
          'Cancel Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.share, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Product info card
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/shirt.png'), // Replace with your asset or NetworkImage
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Crated hay t-shirt',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text('4.5 (Reviews)'),
                      SizedBox(height: 4),
                      Text('₹ 320'),
                      SizedBox(height: 4),
                      Text('Quantity: 01'),
                      Text('Size: 2XL'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Item: Cancel Order",
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: const Text(
                  "Cancel Reasons",
                  style: TextStyle(color: Colors.white),
                ),
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                children: _cancelReasons.map((reason) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: _selectedReason == reason
                            ? Colors.blue.shade100
                            : Colors.white,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedReason = reason;
                        });
                      },
                      child: Text(
                        reason,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onCancelOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Cancel Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
