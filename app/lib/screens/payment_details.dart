import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:movienight/models/cep_data.dart';
import 'package:movienight/services/apiCEP.dart';
import 'package:provider/provider.dart';

import '../models/UserStore.dart';
import '../utils/app_routes.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails>
    with TickerProviderStateMixin {
  String cardName = '';
  String cardNumber = '';
  String cvv = '';
  String valideTo = '';
  late AnimationController lottieController;
  @override
  void initState() {
    super.initState();

    lottieController = AnimationController(
      vsync: this,
    );

    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        lottieController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setCardName(String cardName) {
      setState(() {
        cardName = cardName;
      });
    }

    setCardNumber(String cardNumber) {
      setState(() {
        cardNumber = cardNumber;
      });
    }

    setCvv(String cvv) {
      setState(() {
        cvv = cvv;
      });
    }

    setValideTo(String valideTo) {
      setState(() {
        valideTo = valideTo;
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
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Payment',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
              ),
              Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset("../../assets/lottie/successicon.json",
                            height: 300, width: 300, animate: true, frameRate: FrameRate.max),
                      ],
                    ),
                  ),
                  TextField(
                    onChanged: (String text) {
                      setCardName(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Card Name',
                    ),
                  ),
                  TextField(
                    onChanged: (String text) {
                      setCardNumber(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Card Number',
                    ),
                  ),
                  TextField(
                    onChanged: (String text) {
                      setCvv(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'cvv',
                    ),
                  ),
                  TextField(
                    onChanged: (String text) {
                      setValideTo(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Valide To',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(225, 255, 0, 0),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: TextButton(
                            onPressed: () {
                              // updateUser();
                            },
                            child: const Text(
                              'BUY',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
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
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.PROFILE);
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
