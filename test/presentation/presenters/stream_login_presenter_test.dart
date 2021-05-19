import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mock/validation.mocks.dart';

abstract class Validation {
  String validate({required String field, required String value});
}

class StreamLoginPresenter {
  final Validation validation;

  StreamLoginPresenter({required this.validation});

  void validateEmail(String email) {
    validation.validate(field: 'email', value: email);
  }
}

main() {
  test('should call validation with correct email', () {
    final validation = MockValidation();
    final sut = StreamLoginPresenter(validation: validation);
    final email = 'test@test.com';

    when(validation.validate(field: 'email', value: email)).thenReturn('');

    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });
}
