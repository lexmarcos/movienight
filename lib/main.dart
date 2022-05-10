import 'package:flutter/services.dart';
import 'package:movienight/models/place.dart';
import 'package:movienight/screens/countries_places_screen.dart';
import 'package:movienight/screens/login_screen.dart';
import 'package:movienight/screens/place_detail_screen.dart';
import 'package:movienight/screens/settings_screen.dart';
import 'package:movienight/screens/tabs_screen.dart';
import 'package:movienight/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieNight',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 32, 32, 32),
            titleTextStyle: TextStyle(color: Colors.white),
            iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)), systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              brightness: Brightness.dark,
              primary: const Color.fromARGB(255, 32, 32, 32),
              secondary: const Color.fromARGB(255, 255, 255, 255))),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.COUNTRY_PLACES: (ctx) => CountryPlacesScreen(),
        AppRoutes.PLACES_DETAIL: (ctx) => PlaceDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => const SettingsScreen(),
        AppRoutes.LOGIN: (ctx) => LoginScreen()
      },
    );
  }
}
