import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://i.kym-cdn.com/entries/icons/original/000/033/421/cover2.jpg')),
                SizedBox(width: 24),
                Expanded(
                  child: Text(
                    'Item Name',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
                Text('Quantidade'),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Text('R\$ 99.99')
                ],
              )
            ],
          ),
        ));
  }
}
