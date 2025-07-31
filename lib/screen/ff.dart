import 'package:flutter/material.dart';
import '../models/product.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final Product product;
  final int quantity;
  final String size;

  const OrderConfirmationScreen({
    super.key,
    required this.product,
    required this.quantity,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("Order Confirmation"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 80, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                "Thank you for your order!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text("Product: ${product.title}"),
              Text("Quantity: $quantity"),
              Text("Size: $size"),
              Text("Total: \$${(product.price * quantity).toStringAsFixed(2)}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Shop"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
