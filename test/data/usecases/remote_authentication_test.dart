import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:survey_flutter_clean_arch/data/http/http.dart';
import 'package:survey_flutter_clean_arch/data/usecases/usecases.dart';
import 'package:survey_flutter_clean_arch/domain/helpers/helpers.dart';
import 'package:survey_flutter_clean_arch/domain/usecases/usecases.dart';

import '../../mock/http_client_mock.mocks.dart';

void main() {
  late RemoteAuthentication sut;
  late MockHttpClient httpClient;
  late String url;
  late AuthenticationParams params;

  setUp(() {
    httpClient = MockHttpClient();
    url = 'http://url.test';
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(email: 'test@test.com', password: '123456');
  });

  test('Should call HttpClient witch correct values', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer(
            (_) async => {'accessToken': 'sfsdlfkjaoij', 'name': 'test name'});

    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.password}));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 401',
      () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an Account if HttpClient returns 200', () async {
    final accessToken = 'asoifjasiojfoiasj';
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer(
            (_) async => {'accessToken': accessToken, 'name': 'test name'});

    final account = await sut.auth(params);

    expect(account.token, accessToken);
  });

  test(
      'should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer((_) async => {'invalid_key': 'invalid_value'});

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
