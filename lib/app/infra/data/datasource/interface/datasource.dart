import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/contracts/gateways/http_client.dart';
import 'package:flutter_web/app/domain/usecases/errors/failure_request.dart';

abstract class Datasource {
   Future<Either<FailureRequest, HttpResponse>> auth(Map<String, dynamic> body);
   Future<Either<FailureRequest, HttpResponse>> registre(Map<String, dynamic> body);
}
