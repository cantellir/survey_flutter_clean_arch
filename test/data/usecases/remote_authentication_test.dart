import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mock/http_client_mock.mocks.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void> auth() async {
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void> request({required String url, required String method});
}

void main() {
  late RemoteAuthentication sut;
  late MockHttpClient httpClient;
  late String url;

  setUp(() {
    httpClient = MockHttpClient();
    url = 'http://url.test';
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient witch correct values', () async {
    await sut.auth();

    verify(httpClient.request(url: url, method: 'post'));
  });
}
