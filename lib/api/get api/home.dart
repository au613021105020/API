import 'package:flutter/material.dart';
import 'package:manu/api/get%20api/screen.dart';
import '../data/product_data.dart';
import '../models/product_model.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> filteredList = List.from(productList);
  TextEditingController searchController = TextEditingController();

  void updateSearch(String query) {
    setState(() {
      filteredList = productList
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Grid'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            tooltip: 'Camera',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Camera clicked')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Scan',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Scan clicked')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.location_pin),
            tooltip: 'location',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Scan clicked')),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              controller: searchController,
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.black12,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: filteredList.isEmpty
          ? const Center(child: Text("No products found."))
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: filteredList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          Product p = filteredList[index];
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      p.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            setState(() {
                              filteredList.removeAt(index);
                            });
                          }
                        });
                        return const Center(
                          child: Icon(Icons.delete, color: Colors.red, size: 50),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    p.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("₹${p.price} | ${p.rate} (${p.count})"),
                ),
                const SizedBox(height: 4),
              ],
            ),
          );
        },
      ),
    );
  }
}
