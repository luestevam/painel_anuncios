// ignore_for_file: must_be_immutable

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'errors/emai_failure_empty.dart';
import 'errors/email_failure_invalid.dart';
import 'errors/failure_value_object.dart';

class Email extends Equatable {
  String value;

  Email._(this.value);

  static Either<FailureValueObject, Email> create(String value) {
    if (value.isEmpty || value == '') {
      return Left(EmaiFailureEmpty.create());
    } else if (!value.isEmail) {
      return Left(EmailFailureInvalid.create());
    } else {
      return Right(Email._(value));
    }
  }

  @override
  List<Object> get props => [value];

  
}
