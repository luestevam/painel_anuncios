import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/contracts/repositories/auth_repository.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthUsecases datasource;

  AuthRepositoryImplementation(this.datasource);

  @override
  Future<Either<FailureValueObject, UserEntity>> auth(
      CredentialParamsLogin credentialParamsLogin) async {
    final result = await datasource.auth(credentialParamsLogin);
    if (result.isRight) {
      return Right(result.right);
    } else
      return Left(result.left);
  }

  @override
  Future<Either<FailureValueObject, UserEntity>> registre(
      CredentialParamsLogin credentialParamsLogin) async {
    final result = await datasource.registre(credentialParamsLogin);
    if (result.isRight) {
      return Right(result.right);
    } else
      return Left(result.left);
  }
}
