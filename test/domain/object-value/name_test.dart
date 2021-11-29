import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/objects_values/errors/name_failure.dart';
import 'package:flutter_web/app/domain/objects_values/name.dart';

void main() {
  group('Name', () {
    test('should return error when name is empty', () {
      final sut = Name.create('');

      expect(sut.left, isA<FailureName>());
      expect(sut.isLeft, true);
      expect(sut.left, equals(FailureName.empty()));
    });

    test('should return error when name is short <3 ', () {
      final sut = Name.create('12');

      expect(sut.left, isA<FailureName>());
      expect(sut.isLeft, true);
      expect(sut.left, equals(FailureName.short()));
    });

    test('should return error when name is log > 50', () {
      final sut = Name.create(faker.lorem.words(51).toString());

      expect(sut.left, isA<FailureName>());
      expect(sut.isLeft, true);
      expect(sut.left, equals(FailureName.long()));
    });

    test('should return name when name is correct values', () {
      final name = faker.internet.userName();
      final sut = Name.create(name);

      expect(sut.right, isA<Name>());
      expect(sut.isRight, true);
      expect(sut.right.value, name);
    });
  });
}
