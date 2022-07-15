import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movienight/models/cep_data.dart';
import 'package:movienight/services/apiCEP.dart';
import 'package:provider/provider.dart';

import '../models/UserStore.dart';
import '../utils/app_routes.dart';

class Adress extends StatefulWidget {
  const Adress({Key? key}) : super(key: key);

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  String adress = '';
  String neighborhood = '';
  String city = '';
  String state = '';
  String number = '';
  String cep = '';
  @override
  Widget build(BuildContext context) {
    getCep(String cep) async {
      final ResultCep resultCep = await ApiCEP.get(cep: cep);
      setState(() {
        adress = resultCep.logradouro;
        neighborhood = resultCep.bairro;
        city = resultCep.localidade;
        state = resultCep.uf;
      });
    }

    setCep(String _cep) {
      if (_cep.length == 8) {
        getCep(_cep);
      }
      setState(() {
        cep = _cep;
      });
    }

    setNumber(String number) {
      setState(() {
        number = number;
      });
    }

    return Scaffold(body: Consumer<UserStore>(builder: (context, user, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Adress',
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    )),
              ),
              Column(
                children: [
                  TextField(
                    onChanged: (String text) {
                      setCep(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'CEP',
                    ),
                  ),
                  TextField(
                    controller: TextEditingController()..text = state,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'State',
                    ),
                  ),
                  TextField(
                    controller: TextEditingController()..text = neighborhood,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Neighborhood',
                    ),
                  ),
                  TextField(
                    controller: TextEditingController()..text = adress,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Adress',
                    ),
                  ),
                  TextField(
                    controller: TextEditingController()..text = city,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'City',
                    ),
                  ),
                  TextField(
                    onChanged: (String text) {
                      setNumber(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Number',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(226, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.PAYMENT_DETAILS);
                            },
                            child: const Text(
                              'Go To Payment',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(225, 0, 0, 0),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.CART);
                            },
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ))),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }));
  }
}
