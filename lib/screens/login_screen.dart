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
    doLogin() {
      final store = context.read<UserStore>();
      store.login(username, password);
    }

    Widget _loginButton() {
      return Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
              color: Color(0xE3E50914),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: TextButton(
              onPressed: () {
                doLogin();
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )));
    }

    Widget _logo() {
      return Center(
        child: SizedBox(
          child: Image.network(
              'https://www.iconpacks.net/icons/1/free-movie-icon-850-thumb.png'),
          height: 100,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  _logo(),
                  TextField(
                    onChanged: (String text) {
                      setUsername(text);
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 32),
                  TextField(
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
                        hintText: 'Safe password goes here...'),
                  ),
                  /*Container(
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
                  ),*/
                  SizedBox(height: 80),
                  _loginButton(),
                ],
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  Text("Sign Up",
                      style: TextStyle(
                          color: Color(0xE3E50914),
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
