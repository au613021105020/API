import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  final Product product = Product(
    id: 0,
    title: "Default Product",
    price: 20000,
    image: "assets/img_2.png",
    rate: 5,
    count: 4,
  );

  final Product relatedProduct = Product(
    id: 0,
    title: "Default Product",
    price: 20000,
    image: "assets/img_3.png",
    rate: 5.0,
    count: 4,
  );

  final String fallbackImage = 'assets/default_img_8.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  relatedProduct.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      fallbackImage,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    );
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '₹${product.price}',
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 4),
                  Text('${product.rate} (${product.count} ratings)'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "This is a detailed view of the product. You can add more details here like description, specifications, reviews, etc.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
