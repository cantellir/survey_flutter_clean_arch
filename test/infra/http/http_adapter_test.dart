import 'dart:convert';

import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../../mock/http_spy_mock.mocks.dart';

class HttpAdapter {
  final Client client;

  Future<void> request({required url, required method, Map? body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    await client.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
  }

  HttpAdapter(this.client);
}

void main() {
  late HttpAdapter sut;
  late MockClient client;
  late String url;

  setUp(() {
    client = MockClient();
    sut = HttpAdapter(client);
    url = 'http://test.com';
  });

  group('post', () {
    test('should call post with correct values', () async {
      when(client.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('mockedResponse', 200));

      await sut
          .request(url: url, method: 'post', body: {'any_key': 'any_value'});

      verify(client.post(Uri.parse(url),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          },
          body: jsonEncode({'any_key': 'any_value'})));
    });
  });
}
