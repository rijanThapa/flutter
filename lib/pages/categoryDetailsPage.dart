import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailPage({super.key, required this.categoryName});

  final List<Map<String, dynamic>> clothes = const [
    {
      'label': 'Hoodies',
      'image': 'assets/images/second.png',
      'price': '\$45000',
    },
    {
      'label': 'Shorts',
      'image': 'assets/images/second.png',
      'price': '\$300000',
    },
    {'label': 'Shoes', 'image': 'assets/images/second.png', 'price': '\$60000'},
    {'label': 'Bag', 'image': 'assets/images/second.png', 'price': '\$5000'},
    {
      'label': 'Accessories',
      'image': 'assets/images/second.png',
      'price': '\$2000',
    },
    {
      'label': 'Accessories',
      'image': 'assets/images/second.png',
      'price': '\$2000',
    },
    {
      'label': 'Accessories',
      'image': 'assets/images/second.png',
      'price': '\$2000',
    },
    {
      'label': 'Accessories',
      'image': 'assets/images/second.png',
      'price': '\$2000',
    },
    {
      'label': 'Accessories',
      'image': 'assets/images/second.png',
      'price': '\$2000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: clothes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = clothes[index];
            return _ClothingCard(
              label: item['label'] ?? '',
              image: item['image'] ?? '',
              price: item['price'] ?? '',
            );
          },
        ),
      ),
    );
  }
}

class _ClothingCard extends StatelessWidget {
  final String label;
  final String image;
  final String price;

  const _ClothingCard({
    required this.label,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
