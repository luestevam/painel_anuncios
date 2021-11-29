import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

import 'errors/name_failure.dart';

class Name extends Equatable {
  final String value;

  Name._(this.value);

  static Either<FailureValueObject, Name> create(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return Left(FailureName.empty());
    }
    if (value.length < 3) {
      return Left(FailureName.short());
    }
    if (value.length > 50) {
      return Left(FailureName.long());
    }

    return Right(Name._(value));
  }

  List<Object?> get props => [value];
}
