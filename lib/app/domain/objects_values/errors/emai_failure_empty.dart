
import 'failure_value_object.dart';

class EmaiFailureEmpty implements FailureValueObject {
  EmaiFailureEmpty({
    failureMessage = 'EmaiFailureEmpty',
  });

  factory EmaiFailureEmpty.create() {
    return EmaiFailureEmpty();
  }
}
