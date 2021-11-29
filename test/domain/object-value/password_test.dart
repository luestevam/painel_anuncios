import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/objects_values/errors/password_failure_empty.dart';
import 'package:flutter_web/app/domain/objects_values/errors/password_failure_short.dart';
import 'package:flutter_web/app/domain/objects_values/password.dart';

main() {
  group('Passowrd', () {
    test('should return error if password is less than 5 characters', () {
      final sut = Password.create('12345');
      expect(sut.isLeft, true);
      expect(sut.left, isA<PasswordFailureShort>());
    });
    test('should return error if password is empty', () {
      final sut = Password.create('');
      expect(sut.isLeft, true);
      expect(sut.left, isA<PasswordFailureEmpty>());
    });

     test('should return error if password is empty with space', () {
      final sut = Password.create('      ');
      expect(sut.isLeft, true);
      expect(sut.left, isA<PasswordFailureEmpty>());
    });

    test('should return password if valid', () {
      final sut = Password.create('12345678');
      expect(sut.isRight, true);
      expect(sut.right.value, '12345678');
      expect(sut.right, isA<Password>());
    });
  });
}
