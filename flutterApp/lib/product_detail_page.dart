import 'package:flutter/material.dart';
import 'package:helloworld/PaymentDetailsScreen.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List<String> currentProductImages;
  @override
  void initState() {
    super.initState();
    currentProductImages = productImages1;
    currentProductImages = productImages2;
    currentProductImages = productImages3;
    currentProductImages = productImages4;
  }

  int currentImageIndex = 0;
  final List<String> productImages1 = [
    'https://as2.ftcdn.net/v2/jpg/01/11/50/53/1000_F_111505345_gWgyxCe1ujllUf3Ww5XDZW09i4D4MHFs.jpg',
    'https://as2.ftcdn.net/v2/jpg/04/51/10/43/1000_F_451104324_jq3SzfplMkgIEv6fF99qrsOYJxKkARs8.jpg',
    'https://as2.ftcdn.net/v2/jpg/04/49/38/36/1000_F_449383696_oNnOOkJRO8n7zWlUb8qptDwRjPf4uIA9.jpg',
  ];
  final List<String> productImages2 = [
    'https://img.freepik.com/premium-photo/sale-sarees-different-colors-eastern-market_110194-280.jpg?uid=R196923588&ga=GA1.1.1735098362.1745217236&semt=ais_hybrid&w=740',
    'https://as2.ftcdn.net/v2/jpg/04/51/10/43/1000_F_451104324_jq3SzfplMkgIEv6fF99qrsOYJxKkARs8.jpg',
    'https://as2.ftcdn.net/v2/jpg/04/49/38/36/1000_F_449383696_oNnOOkJRO8n7zWlUb8qptDwRjPf4uIA9.jpg',
  ];
  final List<String> productImages3 = [
    'https://img.freepik.com/premium-photo/sale-sarees-different-colors-eastern-market_110194-280.jpg?uid=R196923588&ga=GA1.1.1735098362.1745217236&semt=ais_hybrid&w=740',
    'https://as2.ftcdn.net/v2/jpg/04/51/10/43/1000_F_451104324_jq3SzfplMkgIEv6fF99qrsOYJxKkARs8.jpg',
    'https://as2.ftcdn.net/v2/jpg/04/49/38/36/1000_F_449383696_oNnOOkJRO8n7zWlUb8qptDwRjPf4uIA9.jpg',
  ];
  final List<String> productImages4 = [
    'https://img.freepik.com/premium-photo/sale-sarees-different-colors-eastern-market_110194-280.jpg?uid=R196923588&ga=GA1.1.1735098362.1745217236&semt=ais_hybrid&w=740',
    'https://as2.ftcdn.net/v2/jpg/04/51/10/43/1000_F_451104324_jq3SzfplMkgIEv6fF99qrsOYJxKkARs8.jpg',
    'https://as2.ftcdn.net/v2/jpg/04/49/38/36/1000_F_449383696_oNnOOkJRO8n7zWlUb8qptDwRjPf4uIA9.jpg',
  ];

  int selectedColorIndex = -1;
  int quantity = 1;
  String selectedSize = '2XL';
  final List<Color> colors = [
    const Color(0xFFB2A165),
    const Color(0xFF009688),
    const Color(0xFF5C1A27),
    const Color(0xFFB2EBF2),
    const Color(0xFFFFC1CC),
    Colors.black,
  ];

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', '2XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF8F5),
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              print("like button");
              // Your logic here
            },
          ),
          SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {
              print("Share button");
              // Your logic here
            },
          ),
          SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.work_outline, color: Colors.black),
            onPressed: () {
              print("Work button");
              // Your logic here
            },
          ),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProductImage(),
          const SizedBox(height: 12),
          _buildTitleAndQuantity(),
          const SizedBox(height: 12),
          _buildVariations(),
          const SizedBox(height: 12),
          _buildAttributes(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF121C2D),
        // shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '₹ 320',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentDetailsScreen()),
                  );
                },
                icon: const Icon(Icons.work_outline),
                label: const Text("Add To Cart"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(currentProductImages[currentImageIndex]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 12,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onPressed: () {
              setState(() {
                currentImageIndex =
                    (currentImageIndex + 1) % currentProductImages.length;
              });
            },
            child:
                Text('${currentImageIndex + 1}/${currentProductImages.length}'),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crated hay t-shirt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('4.5(Reviews)',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.teal),
              onPressed: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
            ),
            Text('$quantity', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.teal),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _buildVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Variations',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Text('Total options: 6 color, 6 size.',
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        const Text('Color:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Row(
          children: List.generate(colors.length, (index) {
            final color = colors[index];
            final isSelected = selectedColorIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    color: isSelected ? Colors.black : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        const Text('Size:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Row(
          children: sizes
              .map((s) => GestureDetector(
                    onTap: () {
                      setState(() => selectedSize = s);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: selectedSize == s
                            ? Colors.teal
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(s,
                          style: TextStyle(
                              color: selectedSize == s
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  Widget _buildAttributes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Product Attributes',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Text('Industry-specific attributes:',
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        _attributeTile('Material', 'Polyester / Cotton'),
        _attributeTile('Quantity', '01'),
        _attributeTile('Sizes', selectedSize),
      ],
    );
  }

  Widget _attributeTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16)),
          )
        ],
      ),
    );
  }
}
