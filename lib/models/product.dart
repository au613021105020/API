
class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final double rating;
  final int count;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    required this.count,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      rating: (json['rating']['rate'] as num).toDouble(),
      count: json['rating']['count'],
    );
  }

  static Product empty() => Product(
    id: 0,
    title: '',
    description: '',
    category: '',
    price: 0.0,
    image: '',
    rating: 0.0,
    count: 0,
  );
}