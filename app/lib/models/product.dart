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

  static const List<Product> products = [
    Product(
        id: 'asdasd12123',
        name: "Camisa Dr.Estrenho",
        price: 24.99,
        imageUrl:
            "https://img.elo7.com.br/product/zoom/2B8AF66/camiseta-doutor-estranho-dr-strange-namorados.jpg"),
    Product(
        id: '123981294qq',
        name: "Caneca Dr.Estranho",
        price: 14.99,
        imageUrl:
            "https://static3.tcdn.com.br/img/img_prod/460977/caneca_doctor_strange_doutor_estranho_heroi_disney_preta_ev_91797_1_18c5e3dca2c6ecc535e0358c74f4eca8.jpg"),
  ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
