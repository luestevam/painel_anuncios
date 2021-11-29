import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

abstract class AuthUsecases {
  Future<Either<FailureValueObject, UserEntity>> auth(
      CredentialParamsLogin credentials);

  Future<Either<FailureValueObject, UserEntity>> registre(CredentialParamsLogin credentials);
}

class CredentialParamsLogin {
  final String email;
  final String password;
  final String? name;

  CredentialParamsLogin(
      {required this.email, required this.password, this.name});


}
