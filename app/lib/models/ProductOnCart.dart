import 'package:movienight/models/product.dart';

class ProductOnCart {
  Product product;
  int quantity = 0;

  ProductOnCart(this.product, this.quantity);
}
