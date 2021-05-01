// Mocks generated by Mockito 5.0.7 from annotations
// in survey_flutter_clean_arch/test/mock/http_client_mock.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;

import '../data/usecases/remote_authentication_test.dart' as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i2.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> request({String? url, String? method}) =>
      (super.noSuchMethod(
          Invocation.method(#request, [], {#url: url, #method: method}),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}
