import 'package:flutter/material.dart';

class EstimatedDeliveryScreen extends StatelessWidget {
  const EstimatedDeliveryScreen({super.key});

  final List<Map<String, dynamic>> steps = const [
    {
      "label": "Order Confirmed Mon, 26th Dec ‘22",
      "isDone": true,
    },
    {
      "label": "Shipped Fri, 26th Dec ‘22",
      "isDone": false,
    },
    {
      "label": "Out For Delivery Fri, 26th Dec ‘22",
      "isDone": false,
    },
    {
      "label": "Delivered Fri, 26th Dec ‘22",
      "isDone": false,
    },
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
          'Order Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Estimated Delivery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  final step = steps[index];
                  final isLast = index == steps.length - 1;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: step['isDone']
                                  ? const Color(0xFF1A1A2E)
                                  : Colors.transparent,
                              border: Border.all(
                                color: const Color(0xFF1A1A2E),
                                width: 2,
                              ),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: step['isDone']
                                ? const Icon(Icons.check,
                                    color: Colors.white, size: 14)
                                : const SizedBox(width: 14, height: 14),
                          ),
                          if (!isLast)
                            Container(
                              width: 2,
                              height: 40,
                              color: const Color(0xFF1A1A2E),
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            step['label'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}
