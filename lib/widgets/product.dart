import 'package:apiprooductspage/models/product.dart';
import 'package:apiprooductspage/screen/details.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final bool colored;

  const ProductCard({
    super.key,
    required this.product,
    this.colored = false,
  });

  Color getCategoryColor(String category) {
    switch (category) {
      case 'electronics':
        return Colors.teal.shade100;
      case 'jewelery':
        return Colors.yellow.shade100;
      case "men's clothing":
        return Colors.blue.shade100;
      case "women's clothing":
        return Colors.pink.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        ),
      ),
      child: Card(
        color: colored ? getCategoryColor(product.category) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(product.image, fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("\$${product.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
