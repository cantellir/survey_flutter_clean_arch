import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mock/http_client_mock.mocks.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}

abstract class HttpClient {
  Future<void> request({required url});
}

void main() {
  test('Should call HttpClient witch correct URL ', () async {
    final httpClient = MockHttpClient();
    final url = 'http://url.test';
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);

    await sut.auth();

    verify(httpClient.request(url: url));
  });
}
