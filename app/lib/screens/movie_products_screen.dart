import 'package:flutter/material.dart';
import 'package:movienight/models/product.dart';
import 'package:movienight/utils/app_routes.dart';

class MovieProductsScreen extends StatelessWidget {
  const MovieProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Products'),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Product.products.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    Product.products[index].imageUrl)),
                            Text(Product.products[index].name),
                            Text('R\$ ${Product.products[index].price}'),
                            IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Adicionou produto ${Product.products[index].name} ao carrinho')));
                                },
                                icon: Icon(Icons.add_circle))
                          ]),
                    );
                  })),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                child: Text('Check Cart'))
          ],
        ));
  }
}
