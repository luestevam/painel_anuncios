
import 'package:equatable/equatable.dart';
import 'package:flutter_web/app/domain/objects_values/errors/failure_value_object.dart';

class FailureName extends Equatable implements FailureValueObject   {
  final String _message;

 

  factory FailureName.empty() {
    return FailureName(message: "Name can't be empty");
  }

  factory FailureName.short() {
    return FailureName(message: "Name must be at least 3 characters");
  }

  factory FailureName.long() {
    return FailureName(message: "Name can't be longer than 50 characters");
  }

  FailureName({required String message}) : _message = message;

  @override
  String toString() => _message;

  @override
  List<Object?> get props => [_message];
}


