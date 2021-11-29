import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

class EmailFailureInvalid extends FailureValueObject {
  EmailFailureInvalid({
    failureMessage = 'EmailInvalid',
  });

  factory EmailFailureInvalid.create() {
    return EmailFailureInvalid();
  }
}
