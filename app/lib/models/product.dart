class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  const Product(this.id, this.name, this.price, this.imageUrl);

  static const List<Product> products = [
    Product(1, "Camisa Dr.Estrenho", 24.99,
        "https://img.elo7.com.br/product/zoom/2B8AF66/camiseta-doutor-estranho-dr-strange-namorados.jpg"),
    Product(2, "Caneca Dr.Estranho", 14.99,
        "https://static3.tcdn.com.br/img/img_prod/460977/caneca_doctor_strange_doutor_estranho_heroi_disney_preta_ev_91797_1_18c5e3dca2c6ecc535e0358c74f4eca8.jpg"),
  ];
}
