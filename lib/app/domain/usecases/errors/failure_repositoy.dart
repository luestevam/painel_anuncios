import 'package:equatable/equatable.dart';
import 'package:flutter_web/app/domain/usecases/errors/failure_request.dart';

class FailureRepository extends Equatable implements FailureRequest {
  final String _message;

  FailureRepository({required String message}) : _message = message;

  factory FailureRepository.badRequest() {
    return FailureRepository(message: 'Bad Request');
  }

  factory FailureRepository.unauthorized() {
    return FailureRepository(message: 'Unauthorized');
  }

  factory FailureRepository.forbidden() {
    return FailureRepository(message: 'Forbidden');
  }

  factory FailureRepository.notFound() {
    return FailureRepository(message: 'Not Found');
  }

  factory FailureRepository.serverError() {
    return FailureRepository(message: 'Server Error');
  }

  factory FailureRepository.conflict() {
    return FailureRepository(message: 'conflict Error');
  }

  @override
  List<Object?> get props => [_message];

  factory FailureRepository.unknownError() {
    return FailureRepository(message: 'unknownError');
  }
}
