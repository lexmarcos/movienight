import 'package:flutter/material.dart';
import 'package:movienight/models/tv.dart';

import 'movie.dart';

class User {
  final int id;
  final String username;
  final String password;
  final List<Movie> watchedMovies;
  final List<TV> watchedTvs;
  int totalTimeWatched;

  User(this.id, this.username, this.password, this.watchedMovies, this.watchedTvs, this.totalTimeWatched);
      
  void addWatchMovie(Movie movie) {
    watchedMovies.add(movie);
    totalTimeWatched += movie.runtime;
  }
  
}
