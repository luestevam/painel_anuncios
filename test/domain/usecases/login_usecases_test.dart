import 'package:either_dart/either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/contracts/repositories/auth_repository.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';
import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';

import 'package:flutter_web/app/domain/usecases/auth_usecases_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_user.dart';

class MockLoginRepository extends Mock implements AuthRepository {}

main() {
  late AuthUsecasesImplementation sut;
  late MockLoginRepository mockLoginRepository;

  final paramets = CredentialParamsLogin(
      email: faker.internet.email(), password: faker.internet.password());

  sucess() async {
    when(() => mockLoginRepository.auth(paramets))
        .thenAnswer((_) async => Right(mockUserObjectFake));
  }

  final parametsErrors =
      CredentialParamsLogin(email: 'carlos', password: '123');
  failure() async {
    when(() => mockLoginRepository.auth(parametsErrors))
        .thenThrow((_) => Exception());
  }

  group('UserCase Login', () {
    setUp(() {
      mockLoginRepository = MockLoginRepository();
      sut = AuthUsecasesImplementation();
    });

    test('Login with valid credentials', () async {
      sucess();
      final result = await sut.auth(paramets);

      expect(result.right.email, equals(paramets.email));
    });

    test('should be return error when Login with invalid credentials',
        () async {
      failure();
      final result = await sut.auth(parametsErrors);

      expect(result.left, isA<FailureValueObject>());
    });
  });
}
