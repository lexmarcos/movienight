import 'package:flutter/material.dart';
import 'package:movienight/models/CartStore.dart';
import 'package:movienight/models/product.dart';
import 'package:movienight/utils/app_routes.dart';
import 'package:provider/provider.dart';

class MovieProductsScreen extends StatefulWidget {
  const MovieProductsScreen({Key? key}) : super(key: key);

  @override
  State<MovieProductsScreen> createState() => _MovieProductsScreenState();
}

class _MovieProductsScreenState extends State<MovieProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Products'),
        ),
        body: Center(
          child: Column(
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
                                    final product = context.read<CartStore>();
                                    product.addToCart(Product.products[index]);
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
          ),
        ));
  }
}

/* 
Consumer<CartStore>(builder: (context, cart, child) {
          return Text("${cart.counter}");
        }));
Center(
          child: Column(
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
          ),
        )*/