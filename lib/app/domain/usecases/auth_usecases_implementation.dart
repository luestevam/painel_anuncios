import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';
import 'package:flutter_web/app/domain/objects_values/email.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';
import 'package:flutter_web/app/domain/objects_values/name.dart';
import 'package:flutter_web/app/domain/objects_values/password.dart';

import 'interfaces/auth_usecases.dart';

class AuthUsecasesImplementation implements AuthUsecases {
  @override
  Future<Either<FailureValueObject, UserEntity>> auth(
      CredentialParamsLogin credentials) async {
    if (Email.create(credentials.email).isLeft) {
      return Left(Email.create(credentials.email).left);
    }

    if (Password.create(credentials.password).isLeft) {
      return Left(Password.create(credentials.password).left);
    }

    final user =
        UserEntity(email: credentials.email, password: credentials.password);

    return Right(user);
  }

  @override
  Future<Either<FailureValueObject, UserEntity>> registre(
      CredentialParamsLogin credentials) async {
    if (Email.create(credentials.email).isLeft) {
      return Left(Email.create(credentials.email).left);
    }

    if (Password.create(credentials.password).isLeft) {
      return Left(Password.create(credentials.password).left);
    }

    if (Name.create(credentials.name).isLeft) {
      return Left(Name.create(credentials.name).left);
    }

    final user = UserEntity(
        email: credentials.email,
        password: credentials.password,
        name: credentials.name);

    return Right(user);
  }
}
