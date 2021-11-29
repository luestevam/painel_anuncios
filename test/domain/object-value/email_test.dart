import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/objects_values/email.dart';
import 'package:flutter_web/app/domain/objects_values/errors/emai_failure_empty.dart';
import 'package:flutter_web/app/domain/objects_values/errors/email_failure_invalid.dart';

main() {
  group('Email', () {
    test('should return error  when email is invalid', () {
      final sut = Email.create('carlos');

      expect(sut.left, isA<EmailFailureInvalid>());
      expect(sut.isLeft, true);
    });

    test('should be return error when email is empty ', () {
      final sut = Email.create('');

      expect(sut.left, isA<EmaiFailureEmpty>());
      expect(sut.isLeft, true);
    });

    test('should be return email when email is valid', () {
      final sut = Email.create(faker.internet.email());

      expect(sut.isRight, true);
    });

    test('should be return same email when email is valid', () {
      final email = faker.internet.email();
      final sut = Email.create(email);

      expect(sut.isRight, true);
      expect(sut.right.value, email);
    });
  });
}
