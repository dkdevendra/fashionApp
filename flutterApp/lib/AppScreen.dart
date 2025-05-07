import 'package:flutter/material.dart';
import 'package:helloworld/menu.dart';
import 'package:helloworld/profileAccount.dart';
import 'product_detail_page.dart'; // <-- Add this import

class FashionHomePage extends StatefulWidget {
  const FashionHomePage({super.key});

  @override
  State<FashionHomePage> createState() => _FashionHomePageState();
}

class _FashionHomePageState extends State<FashionHomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Menu')),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Profile')),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEAF8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF8F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
            // Example: Open drawer or navigate

            //Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text(
          'Fashion',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              print("Notifications tapped");
              // Your logic here
            },
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              // Your logic here
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          controller: _scrollController,
          children: [
            _buildBanner(),
            const SizedBox(height: 16),
            _buildCategories(),
            const SizedBox(height: 16),
            _buildTopProductHeader(),
            const SizedBox(height: 16),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const FashionHomePage()), //homePAfe
              );
              break;

            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AccountScreen()), //SearchPage
              );
              break;

            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AccountScreen()), //MassagePage
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AccountScreen()), //FAvpritePage
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AccountScreen()), //AcoountPage
              );
              break;
            case 5:
            default:
              break;
          }
        },
        //   if (index == 4) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (_) => const AccountScreen()),
        //     );
        //   } else {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   }
        // },
        //showUnselectedLabels: false, // 👈 this hides text for unselected tabs
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded), label: 'Massage'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF121C2D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("30% OFF",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text("On Every Product Today",
                    style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: const Text("Shop Now"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            height: 80,
            width: 80,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://as2.ftcdn.net/v2/jpg/01/11/50/53/1000_F_111505345_gWgyxCe1ujllUf3Ww5XDZW09i4D4MHFs.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopProductHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Top Product',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('See All', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildCategories() {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.checkroom, 'label': 'Shirt'},
      {'icon': Icons.emoji_people, 'label': 'Hoodie'},
      {'icon': Icons.work_outline, 'label': 'Pant'},
      {'icon': Icons.checkroom_outlined, 'label': 'Sweater'},
    ];

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(categories[index]['icon'], color: Colors.black),
              ),
              const SizedBox(height: 6),
              Text(categories[index]['label']),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
      ),
    );
  }

  Widget _buildProductGrid() {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Crated hay t-shirt',
        'price': '₹ 320',
        'image':
            'https://as2.ftcdn.net/v2/jpg/01/11/50/53/1000_F_111505345_gWgyxCe1ujllUf3Ww5XDZW09i4D4MHFs.jpg',
      },
      {
        'name': 'White Men’s Hoodies',
        'price': '₹ 320',
        'image':
            'https://img.freepik.com/free-photo/interior-clothing-store-with-stylish-merchandise-racks-fashionable-brand-design-casual-wear-modern-boutique-empty-fashion-showroom-shopping-centre-with-elegant-merchandise_482257-65537.jpg?uid=R196923588&ga=GA1.1.1735098362.1745217236&semt=ais_hybrid&w=740',
      },
      {
        'name': 'Blue Jeans Jacket',
        'price': '₹ 550',
        'image':
            'https://img.freepik.com/premium-photo/women-s-fashion-store-shopping-mall_1112-8133.jpg?uid=R196923588&ga=GA1.1.1735098362.1745217236&semt=ais_hybrid&w=740',
      },
      {
        'name': 'Crated hay t-shirt',
        'price': '₹ 320',
        'image':
            'https://img.freepik.com/free-photo/friends-shopping-second-hand-market_23-2149353744.jpg?uid=R196923588&ga=GA1.1.1735098362.1745217236&semt=ais_hybrid&w=740',
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (_, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailPage(
                    // name: product['name'],
                    // price: product['price'],
                    // image: product['image'],
                    ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                        image: NetworkImage(product['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name'],
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 4),
                      const Text('4.5 (Reviews)',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text(product['price'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.checkroom, 'label': 'Shirt'},
    {'icon': Icons.emoji_people, 'label': 'Hoodie'},
    {'icon': Icons.work_outline, 'label': 'Pant'},
    {'icon': Icons.checkroom_outlined, 'label': 'Sweater'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 buttons per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.black12),
                ),
              ),
              onPressed: () {
                // Handle button click here
                debugPrint('Selected: ${category['label']}');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category['icon'], size: 48),
                  const SizedBox(height: 10),
                  Text(category['label'], style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
