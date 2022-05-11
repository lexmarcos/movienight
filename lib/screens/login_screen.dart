import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/UserStore.dart';
import '../utils/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';

  setUsername(String _username) {
    setState(() {
      username = _username;
    });
  }

  String password = '';

  setPassword(String _password) {
    setState(() {
      password = _password;
    });
  }

  @override
  Widget build(BuildContext context) {
    doLogin(){
      final store = context.read<UserStore>();
          store.login(username, password);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                onChanged: (String text) {
                  setUsername(text);
                },
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Username',),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (String text) {
                  setPassword(text);
                },
                obscureText: true,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Password',
                    hintText: 'Informe uma senha segura'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  doLogin();
                  Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('Novo usuário? Criar uma conta')
          ],
        ),
      ),
    );
  }
}
