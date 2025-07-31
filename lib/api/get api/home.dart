import 'package:apiprooductspage/models/product.dart';
import 'package:apiprooductspage/services/api.dart';
import 'package:apiprooductspage/widgets/product.dart';
import 'package:flutter/material.dart';

    class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProducts = [];
  List<Product> featuredProducts = [];
  List<Product> filteredProducts = [];
  String selectedCategory = 'all';
  String searchQuery = '';

  final List<String> categories = [
    'all',
    'electronics',
    'jewelery',
    "men's clothing",
    "women's clothing"
  ];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    final products = await ApiService.fetchProducts();
    setState(() {
      allProducts = products;

      featuredProducts = categories
          .where((c) => c != 'all')
          .map((category) => products.firstWhere(
            (p) => p.category == category,
        orElse: () => Product.empty(),
      ))
          .toList();

      filterByCategory(selectedCategory);
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      List<Product> baseList = (category == 'all')
          ? allProducts
          : allProducts.where((p) => p.category == category).take(3).toList();

      filteredProducts = baseList
          .where((p) =>
          p.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  void onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
      filterByCategory(selectedCategory);
    });
  }

  Widget buildCategoryButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                foregroundColor: isSelected ? Colors.white : Colors.black,
              ),
              onPressed: () => filterByCategory(category),
              child: Text(
                category == 'all' ? 'All Products' : category,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: TextField(
          onChanged: onSearchChanged,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search products...',
            hintStyle: const TextStyle(color: Colors.white60),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: Colors.white),
          ),
        ),
        actions: const [
          Icon(Icons.camera_alt, color: Colors.white),
          SizedBox(width: 12),
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: allProducts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Featured Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredProducts.length,
                itemBuilder: (context, index) {
                  final product = featuredProducts[index];
                  return SizedBox(
                    width: 160,
                    child: ProductCard(product: product, colored: true),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            buildCategoryButtons(),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                      product: filteredProducts[index], colored: true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
