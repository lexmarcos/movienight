import 'package:flutter/material.dart';

class User {
  final String id;
  final String username;
  final String password;
  final String watchedMovies;
  final String watchedTvs;
  final int totalTimeWatched;

  const User(
      {required this.id,
      required this.username,
      required this.totalTimeWatched,
      required this.password,
      required this.watchedMovies,
      required this.watchedTvs});
}
