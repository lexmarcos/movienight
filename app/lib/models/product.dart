class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  const Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
