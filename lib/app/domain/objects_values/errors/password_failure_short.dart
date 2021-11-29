import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

class PasswordFailureShort extends FailureValueObject {
  PasswordFailureShort({
    failureMessage = 'Password must be at least 6 characters',
  });

  factory PasswordFailureShort.create() {
    return PasswordFailureShort();
  }
}
