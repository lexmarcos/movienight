import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movienight/models/CartStore.dart';

import '../utils/app_routes.dart';

class SuccessBuy extends StatefulWidget {
  const SuccessBuy({Key? key}) : super(key: key);

  @override
  State<SuccessBuy> createState() => _SuccessBuyState();
}

class _SuccessBuyState extends State<SuccessBuy> {
  //final arguments = ModalRoute.of(context)!.settings.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          child: Center(
              child: Expanded(
            child: Container(
              height: 200,
              child: Column(
                children: [
                  Icon(Icons.check_circle,
                      size: 128, color: Color.fromARGB(255, 29, 230, 129)),
                  Text("Oba! Sua compra foi concluída!"),
                ],
              ),
            ),
          )),
          alignment: Alignment.center),
      bottomNavigationBar: Container(
          height: 70,
          child: ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                'Home',
                style: TextStyle(fontSize: 24),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 17, 0))))),
    );
  }
}

/* 
Padding(
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
        )*/