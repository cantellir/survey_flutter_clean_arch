import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mock/http_client_mock.mocks.dart';
import 'package:survey_flutter_clean_arch/domain/usecases/usecases.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final body = {'email': params.email, 'password': params.password};
    await httpClient.request(url: url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void> request({required String url, required String method, Map body});
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
    final params =
        AuthenticationParams(email: 'test@test.com', password: '123456');

    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.password}));
  });
}
