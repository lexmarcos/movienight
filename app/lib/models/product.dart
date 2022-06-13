class Product {
  final int id;
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
        id: 1,
        name: "Camisa Dr.Estrenho",
        price: 24.99,
        imageUrl:
            "http://https://img.elo7.com.br/product/zoom/2B8AF66/camiseta-doutor-estranho-dr-strange-namorados.jpg"),
    Product(
        id: 2,
        name: "Caneca Dr.Estranho",
        price: 14.99,
        imageUrl:
            "https://static3.tcdn.com.br/img/img_prod/460977/caneca_doctor_strange_doutor_estranho_heroi_disney_preta_ev_91797_1_18c5e3dca2c6ecc535e0358c74f4eca8.jpg"),
  ];
}
