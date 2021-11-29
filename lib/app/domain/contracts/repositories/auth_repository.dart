import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';
import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';

abstract class AuthRepository {
  Future<Either<FailureValueObject, UserEntity>>  auth(
      CredentialParamsLogin credentialParamsLogin);

  Future<Either<FailureValueObject, UserEntity>>  registre(
      CredentialParamsLogin credentialParamsLogin);
}
