import 'package:flutter/material.dart';
import 'package:movienight/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movienight/services/api.dart';
import 'movie.dart';
import 'package:localstore/localstore.dart';

class UserStore extends ChangeNotifier {
  late User? user;
  final db = Localstore.instance;

  Future<http.Response> login(String username, String password) async {
    http.Response response = await Api.post('/auth/login', {
      "username": username,
      "password": password,
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body)['user'];
      user = User.fromJson(userData);

      // Saves to localstorage
      db
          .collection('user')
          .doc(user!.id)
          .set(json.decode(response.body)['user']);
      notifyListeners();
    }
    return response;
  }

  Future<http.Response> logout() async {
    http.Response response = await Api.get('/auth/logout');
    if (response.statusCode == 200) {
      // Saves to localstorage
      db.collection('user').doc(user!.id).delete();
      user = null;
      notifyListeners();
    }
    return response;
  }

  Future<bool> hasUserOnLocalStorage() async {
    final db = Localstore.instance;
    return db.collection('user').get().then((value) {
      if (value != null) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> getUserFromLocalStorage() async {
    final db = Localstore.instance;
    return db.collection('user').get().then((value) {
      if (value != null) {
        user = User.fromJson(value.entries.first.value);
        return true;
      }
      return false;
    });
  }

  void addWatchMovie(Movie movie) {
    user!.addWatchMovie(movie);
  }

  void removeWatchMovie(Movie movie) {
    user!.removeWatchMovie(movie);
    notifyListeners();
  }
}
