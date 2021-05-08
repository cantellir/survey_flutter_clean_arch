import 'dart:convert';

import 'package:http/http.dart';

class HttpAdapter {
  final Client client;

  Future<Map?> request({required url, required method, Map? body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    final response =
        await client.post(Uri.parse(url), headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    }
    return null;
  }

  HttpAdapter(this.client);
}
