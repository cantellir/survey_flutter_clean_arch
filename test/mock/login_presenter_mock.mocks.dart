// Mocks generated by Mockito 5.0.7 from annotations
// in survey_flutter_clean_arch/test/mock/login_presenter_mock.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:survey_flutter_clean_arch/ui/pages/login/login_presenter.dart'
    as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [LoginPresenter].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginPresenter extends _i1.Mock implements _i2.LoginPresenter {
  MockLoginPresenter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<String?> get emailErrorStream =>
      (super.noSuchMethod(Invocation.getter(#emailErrorStream),
          returnValue: Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i3.Stream<String?> get passwordErrorStream =>
      (super.noSuchMethod(Invocation.getter(#passwordErrorStream),
          returnValue: Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i3.Stream<String?> get mainErrorStream =>
      (super.noSuchMethod(Invocation.getter(#mainErrorStream),
          returnValue: Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i3.Stream<bool?> get isFormValidStream =>
      (super.noSuchMethod(Invocation.getter(#isFormValidStream),
          returnValue: Stream<bool?>.empty()) as _i3.Stream<bool?>);
  @override
  _i3.Stream<bool?> get isLoadingStream =>
      (super.noSuchMethod(Invocation.getter(#isLoadingStream),
          returnValue: Stream<bool?>.empty()) as _i3.Stream<bool?>);
  @override
  void validateEmail(String? value) =>
      super.noSuchMethod(Invocation.method(#validateEmail, [value]),
          returnValueForMissingStub: null);
  @override
  void validatePassword(String? value) =>
      super.noSuchMethod(Invocation.method(#validatePassword, [value]),
          returnValueForMissingStub: null);
  @override
  void auth() => super.noSuchMethod(Invocation.method(#auth, []),
      returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
