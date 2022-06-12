import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
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
}
