import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import 'errors/failure_value_object.dart';
import 'errors/password_failure_empty.dart';
import 'errors/password_failure_short.dart';

class Password extends Equatable {
  final String value;

  Password._(this.value);

  static Either<FailureValueObject, Password> create(String password) {
    if (password.isEmpty || password.trim() == '') {
      return Left(PasswordFailureEmpty.create());
    } else if (password.length < 6) {
      return Left(PasswordFailureShort.create());
    } else {
      return Right(Password._(password));
    }
  }

  @override
  List<Object> get props => [value];
}
