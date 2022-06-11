import 'package:flutter/material.dart';
import 'package:movienight/models/user.dart';

import 'movie.dart';

class UserStore extends ChangeNotifier {
  late User user;

  void login(String username, String password) {
    user = User(0, username, password, [], [], 0);
  }

  void addWatchMovie(Movie movie){
    user.addWatchMovie(movie);
  }
}
