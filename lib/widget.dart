import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProductCard(
            title: 'Wireless Headphones',
            price: '\$59.99',
            imageAsset: 'assets/img_3.png',
          ),
          ProductCard(
            title: 'Smart Watch',
            price: '\$99.99',
            imageAsset: 'assets/img_4.png',
          ),
        ],
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Product List'),
      backgroundColor: Colors.green,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageAsset;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(imageAsset, width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(price,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Icon(Icons.shopping_cart),
          ],
        ),
      ),
    );
  }
}
