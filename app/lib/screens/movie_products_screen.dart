import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movienight/models/movie.dart';
import 'package:movienight/models/product.dart';
import 'package:movienight/services/api.dart';
import 'package:movienight/utils/app_routes.dart';

class MovieProductsScreen extends StatefulWidget {
  const MovieProductsScreen({Key? key}) : super(key: key);

  @override
  State<MovieProductsScreen> createState() => _MovieProductsScreenState();
}

class _MovieProductsScreenState extends State<MovieProductsScreen> {
  Future<List<Product>> getProductsOfMovie(context) async {
    if (ModalRoute.of(context)!.settings.arguments == Null) {}
    final arguments = ModalRoute.of(context)!.settings.arguments as Movie;

    Response response =
        await Api.get('http://localhost:3000/api/stores/', params: {
      'movieID': arguments.id.toString(),
    });
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      List? listOfProducts = responseJson['store']['products'];
      if (listOfProducts != null) {
        return (responseJson['store']['products'] as List)
            .map((p) => Product.fromJson(p))
            .toList();
      }
      return [];
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProductsOfMovie(context).then((result) {
        setProducts(result);
      });
    });
  }

  List<Product>? products;
  setProducts(List<Product> _products) {
    setState(() {
      products = _products;
    });
  }
  
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
