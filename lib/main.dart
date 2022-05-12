import 'package:flutter/services.dart';
import 'package:movienight/models/place.dart';
import 'package:movienight/screens/login_screen.dart';
import 'package:movienight/screens/movie_screen.dart';
import 'package:movienight/screens/tabs_screen.dart';
import 'package:movienight/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/UserStore.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserStore(),
      child: MaterialApp(
        title: 'MovieNight',
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 32, 32, 32),
              titleTextStyle: TextStyle(color: Colors.white),
              iconTheme: IconThemeData(
                  color: const Color.fromARGB(255, 255, 255, 255)),
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
            scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
            colorScheme: ColorScheme.fromSwatch().copyWith(
                brightness: Brightness.dark,
                primary: const Color.fromARGB(255, 35, 38, 43),
                secondary: const Color.fromARGB(255, 255, 255, 255))),
        themeMode: ThemeMode.dark,
        initialRoute: '/login',
        routes: {
          AppRoutes.HOME: (ctx) => TabsScreen(),
          AppRoutes.LOGIN: (ctx) => LoginScreen(),
          AppRoutes.MOVIE: (ctx) => MovieScreen()
        },
      ),
    );
  }
}
