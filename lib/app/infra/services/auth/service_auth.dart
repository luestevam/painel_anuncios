import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';
import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';

abstract class ServiceAuth {
  Future<Either<Exception, UserEntity>> auth(
      CredentialParamsLogin credentialParamsLogin);
  Future<Either<Exception, UserEntity>> registre(
      CredentialParamsLogin credentialParamsLogin);
}
