import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../../mock/http_spy_mock.mocks.dart';

class HttpAdapter {
  final Client client;

  Future<void> request({required url, required method}) async {
    await client.post(Uri.parse(url));
  }

  HttpAdapter(this.client);
}

void main() {
  group('post', () {
    test('should call post with correct values', () async {
      final client = MockClient();
      final sut = HttpAdapter(client);
      final url = 'http://test.com';
      when(client.post(any))
          .thenAnswer((_) async => http.Response('mockedResponse', 200));

      await sut.request(url: url, method: 'post');

      verify(client.post(Uri.parse(url)));
    });
  });
}