import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstore/localstore.dart';

class Api {
  

  static Future<String> getTokenOfUser(){
    final db = Localstore.instance;
    return db.collection('user').get().then((value) {
      if (value != null) {
        print(value.entries.first.value);
        return value.entries.first.value['token'];
      } else {
        return '';
      }
    });
  }

  static post(String url, Map<String, dynamic> body) async {
    final uri = Uri.parse(url);
    final headers = {'Content-Type': 'application/json'};
    body = body;
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    return response;
  }

  static get(String url) async {
    final uri = Uri.parse(url);
    final headers = {'Content-Type': 'application/json', 'x-access-token': await getTokenOfUser()};

    http.Response response = await http.get(
      uri,
      headers: headers
    );

    return response;
  }
}
