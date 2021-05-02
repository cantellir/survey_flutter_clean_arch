import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:survey_flutter_clean_arch/data/usecases/usecases.dart';
import 'package:survey_flutter_clean_arch/domain/usecases/usecases.dart';

import '../../mock/http_client_mock.mocks.dart';

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
