import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

class PasswordFailureEmpty extends FailureValueObject {
  PasswordFailureEmpty({failureMessage = 'Password can not be empty'});

  factory PasswordFailureEmpty.create() {
    return PasswordFailureEmpty();
  }
}
