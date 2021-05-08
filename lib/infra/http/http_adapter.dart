import 'dart:convert';

import 'package:http/http.dart';

import 'package:survey_flutter_clean_arch/data/http/http.dart';

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
    return _handleResponse(response);
  }

  Map? _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    }

    if (response.statusCode == 204) {
      return null;
    }

    if (response.statusCode == 400) {
      throw HttpError.badRequest;
    }

    if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    }

    if (response.statusCode == 403) {
      throw HttpError.forbidden;
    }

    throw (HttpError.serverError);
  }

  HttpAdapter(this.client);
}
