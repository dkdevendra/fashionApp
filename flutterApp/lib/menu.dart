import 'package:flutter/material.dart';
import 'package:helloworld/noticebord.dart';
import 'package:helloworld/settings.dart';
import 'package:helloworld/support.dart';
import 'AppScreen.dart';
import 'OrderDetails.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F4F1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          _buildProfileHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(11),
              children: [
                _buildMenuButton(Icons.storefront, "My Shop",
                    const SettingsScreen()), //MyShopScreen
                _buildMenuButton(
                    Icons.shopping_bag, "Orders", const OrderDetailsScreen()),
                _buildMenuButton(Icons.inventory, "Inventory",
                    const SettingsScreen()), //InventoryScreen
                _buildMenuButton(Icons.upload_file, "Catalog Upload",
                    const SettingsScreen()), //CatalogUploadScreen
                _buildMenuButton(Icons.payment, "Payments",
                    const PaymentsScreen()), //PaymentsScreen
                _buildMenuButton(Icons.campaign, "Advertisement",
                    const SettingsScreen()), //AdvertisementScreen
                _buildMenuButton(Icons.support_agent, "Support",
                    const SupportScreen()), //SupportScreen
                _buildMenuButton(Icons.notifications, "Notice Board",
                    const NoticeBoardLeaveRequestScreen()), //NoticeBoardScreen
                _buildMenuButton(
                    Icons.settings, "Settings", const SettingsScreen()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xff102a41),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFF06283D),
        showSelectedLabels: true,
        //currentIndex: 3, // 'Menu' is selected
        // type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const InventoryScreen()), //InventoryScreen
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const OrdersScreen()), //OrdersScreen
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MenuScreen()),
              );
            case 4:
            default:
              // Stay on MenuScreen
              break;
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: "Inventory"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFD0F0E9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_circle, size: 50),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Sudo Tech",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text("3.7 ★   0 Ratings   0 Followers",
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String title, Widget screen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB6E2D3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
      ),
    );
  }

  // Widget _buildMenuButton(IconData icon, String title) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       border: Border.all(color: const Color(0xFFB6E2D3), width: 1),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           blurRadius: 4,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: ListTile(
  //       leading: Icon(icon, color: Colors.teal),
  //       title: Text(title),
  //       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
  //       onTap: () {
  //         // TODO: Navigate to respective screen
  //       },
  //     ),
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

//HomeScreen
//
//
//
//
//
// Make sure to import your other screens here
// import 'inventory_screen.dart';
// import 'orders_screen.dart';
// import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // FIXED
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStep = 1;
  int _currentIndex = 0;

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
          'Home',
          style: TextStyle(
            color: Color(0xFF102A41),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome ATS Global Tech',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF102A41),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Let’s get your business started in 3 steps',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF102A41),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Steps Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                _stepBox(1, 'Upload\nCatalog'),
                const SizedBox(width: 8),
                _stepBox(2, 'Catalogs\nGo Live'),
                const SizedBox(width: 8),
                _stepBox(3, 'Get First\nOrder'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Upload Catalog Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentStep = 2;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF102A41),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Upload Catalog',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Live Training Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD4F1EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.play_circle_outline,
                    size: 32, color: Color(0xFF102A41)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Join free live training',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF102A41),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Get free live training on catalog upload with our experts',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF102A41)),
                      ),
                      const SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Training booked!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xFF00A8A3)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Book Training Now',
                          style: TextStyle(
                            color: Color(0xFF00A8A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xff102a41),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFF06283D),
        showSelectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InventoryScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrdersScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MenuScreen()),
              );
              break;
            default:
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: "Inventory"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  Widget _stepBox(int number, String label) {
    bool isActive = number == currentStep;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentStep = number;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: isActive ? const Color(0xFF00A8A3) : Colors.black54,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
            color: isActive ? Colors.white : Colors.transparent,
          ),
          child: Column(
            children: [
              Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? const Color(0xFF00A8A3)
                      : const Color(0xFF102A41),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isActive
                      ? const Color(0xFF00A8A3)
                      : const Color(0xFF102A41),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//InventoryScreen

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  int _currentIndex = 0;
  List<String> inventoryItems = List.generate(5, (_) => 'Dollie Bullock');
  String selectedTab = 'All Stock';

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
          'Inventory',
          style: TextStyle(
            color: Color(0xFF102A41),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xff102a41),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFF06283D),
        showSelectedLabels: true,
        //currentIndex: 3, // 'Menu' is selected
        // type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const InventoryScreen()), //InventoryScreen
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const OrdersScreen()), //OrdersScreen
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MenuScreen()),
              );
            case 4:
            default:
              // Stay on MenuScreen
              break;
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: "Inventory"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.assignment), label: 'Inventory'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_bag), label: 'Orders'),
      //     BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            _buildTabButtons(),
            _buildActionButtons(),
            Expanded(child: _buildInventoryList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(Icons.play_circle_fill),
          title: Text("Learn how to process your order"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Upload New Catalog Here", style: TextStyle(fontSize: 14)),
            Text("Upload", style: TextStyle(color: Colors.teal)),
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _buildTabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _tabButton('All Stock'),
        _tabButton('Out of Stock'),
        _tabButton('Low Stock'),
      ],
    );
  }

  Widget _tabButton(String label) {
    bool isSelected = selectedTab == label;
    return ElevatedButton(
      onPressed: () => setState(() => selectedTab = label),
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.teal,
        backgroundColor: isSelected ? Colors.teal : Colors.white,
        side: BorderSide(color: Colors.teal),
      ),
      child: Text(label),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.sort),
              label: Text('SORT'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.filter_list),
              label: Text('FILTER'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryList() {
    return ListView.builder(
      itemCount: inventoryItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Checkbox(value: false, onChanged: (_) {}),
          title: Text(inventoryItems[index]),
          subtitle: Text("₹ 73.31"),
          trailing: Text("Credit Card"),
        );
      },
    );
  }
}

//order screen
//
//
//

// Dummy screens for navigation
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _currentIndex = 2; // Default to "Orders" tab

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
          'Orders',
          style: TextStyle(
            color: Color(0xFF102A41),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Learn how to process your order
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFD4F1EE),
            child: Row(
              children: const [
                Icon(Icons.play_circle_outline, color: Color(0xFF102A41)),
                SizedBox(width: 12),
                Text(
                  'Learn how to process your order',
                  style: TextStyle(
                    color: Color(0xFF102A41),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Status buttons
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _statusButton('(0)\nOn Hold'),
                const SizedBox(width: 8),
                _statusButton('(0)\nPending'),
                const SizedBox(width: 8),
                _statusButton('Ready to Ship'),
              ],
            ),
          ),

          // Filter/Search Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'SKU ID',
                        items: const [
                          DropdownMenuItem(
                            value: 'SKU ID',
                            child: Text('SKU ID'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Orders List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Checkbox(
                      value: false,
                      onChanged: (_) {},
                    ),
                    title: const Text('1   Dollie Bullock'),
                    subtitle: const Text('₹ 73.31'),
                    trailing: const Text('Credit Card'),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF102A41),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFF06283D),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const InventoryScreen()),
              );
              break;
            case 2:
              // Stay on OrdersScreen
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MenuScreen()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: "Inventory"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  Widget _statusButton(String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(color: Colors.teal),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF00A8A3),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Payments"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaymentCard(context),
            const SizedBox(height: 16),
            _buildPaymentCard(context),
            const SizedBox(height: 32),
            const Text(
              "Payment over time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(radius: 5, backgroundColor: Colors.teal),
                SizedBox(width: 8),
                Text("Payments to Date"),
                SizedBox(width: 16),
                CircleAvatar(radius: 5, backgroundColor: Colors.tealAccent),
                SizedBox(width: 8),
                Text("Outstanding Payment"),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Trade to Show",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "There is no sufficient data to show the results in the selected timeframe.",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Payments to Date"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "₹0",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompensationPaymentsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade50,
                  foregroundColor: Colors.teal,
                  shadowColor: Colors.transparent,
                ),
                child: const Text("View Details"),
              ),
            ],
          ),
          const Divider(),
          const Text("Last payment: ₹0"),
        ],
      ),
    );
  }
}

class CompensationPaymentsScreen extends StatelessWidget {
  const CompensationPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Payments"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            CompensationCard(
              compensation: 0,
              recoveries: 0,
              total: 0,
              showBreakdown: true,
            ),
            SizedBox(height: 16),
            CompensationCard(
              compensation: 0,
              recoveries: 0,
              total: 0,
              showBreakdown: false,
            ),
          ],
        ),
      ),
    );
  }
}

class CompensationCard extends StatelessWidget {
  final double compensation;
  final double recoveries;
  final double total;
  final bool showBreakdown;

  const CompensationCard({
    super.key,
    required this.compensation,
    required this.recoveries,
    required this.total,
    this.showBreakdown = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Compensation & Recoveries",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text("Payments to Date"),
          const SizedBox(height: 8),
          if (showBreakdown) ...[
            _buildRow("Compensation", compensation),
            _buildRow("Recoveries", recoveries),
          ],
          _buildRow("Total", total),
        ],
      ),
    );
  }

  Widget _buildRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text("₹ ${amount.toStringAsFixed(0)}"),
        ],
      ),
    );
  }
}
