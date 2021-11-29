import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/contracts/repositories/auth_repository.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';

import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';

import 'package:flutter_web/app/infra/data/datasource/interface/datasource.dart';

import './service_auth.dart';

class ServiceAuthImpl implements ServiceAuth {
  final Datasource _datasource;

  final AuthRepository _repository;

  ServiceAuthImpl(
      {required Datasource datasource, required AuthRepository repository})
      : this._datasource = datasource,
        this._repository = repository;

  @override
  Future<Either<Exception, UserEntity>> auth(
      CredentialParamsLogin credentialParamsLogin) async {
    final userOrError = await _repository.auth(credentialParamsLogin);

    if (userOrError.isLeft) {
      return Left(userOrError.left);
    }

    final result = await _datasource.auth(userOrError.right.toJsonForAuth());

    if (result.isLeft) {
      return Left(result.left);
    }

    return Right(UserEntity.fromJson(result.right.data));
  }

  @override
  Future<Either<Exception, UserEntity>> registre(
      CredentialParamsLogin credentialParamsLogin) async {
    final userOrError = await _repository.registre(credentialParamsLogin);

    if (userOrError.isLeft) {
      return Left(userOrError.left);
    }

    final result =
        await _datasource.registre(userOrError.right.toJsonForRegistry());

    if (result.isLeft) {
      return Left(result.left);
    }

    return Right(UserEntity.fromJson(result.right.data));
  }
}
