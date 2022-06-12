class AppRoutes {
  static const HOME = '/';
  static const COUNTRY_PLACES = '/country-places';
  static const PLACES_DETAIL = '/place-detail';
  static const SETTINGS = '/settings';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const MOVIE = '/movie';
  static const PRODUCTS = '/products';
  static const CART = '/cart';
  static const FIRSTLOAD = '/firstload';
}

String getTimeString(int value) {
  final int hour = value ~/ 60;
  final int minutes = value % 60;
  return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
}
