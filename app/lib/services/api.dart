import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstore/localstore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Api {
  static Future<String> getTokenOfUser() {
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
    String host = '';
    if(dotenv.env['MODE'] == 'DEV'){
      host = 'http://localhost:3000/api';
    }else{
      host = 'https://movienight-theta.vercel.app/api';
    }
    final uri = Uri.parse("$host$url");
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

  static get(String url, {Map<String, dynamic>? params}) async {
    Uri uri;
    if(dotenv.env['MODE'] == 'DEV'){
      uri = Uri.http('localhost:3000', "/api$url", params);
    }else{
      uri = Uri.https('https://movienight-theta.vercel.app/api', url, params);
    }
    
    final headers = {'Content-Type': 'application/json', 'x-access-token': await getTokenOfUser()};

    http.Response response = await http.get(
      uri,
      headers: headers
    );

    return response;
  }
}
