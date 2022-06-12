import 'package:flutter/material.dart';
import 'package:movienight/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movienight/services/api.dart';
import 'movie.dart';

class UserStore extends ChangeNotifier {
  late User user;

  Future<http.Response> login(String username, String password) async{
    http.Response response = await Api.post('https://movienight-theta.vercel.app/api/auth/login', {
      "username": username,
      "password": password,
    });
    if(response.statusCode == 200){
      final Map<String, dynamic> userData = json.decode(response.body)['user'];
      user = User.fromJson(userData);
      notifyListeners();
    }
    return response;
  }

  void addWatchMovie(Movie movie) {
    user.addWatchMovie(movie);
  }
}
