import 'package:either_dart/either.dart';
import 'package:flutter_web/app/domain/contracts/gateways/http_client.dart';
import 'package:flutter_web/app/domain/usecases/errors/failure_repositoy.dart';
import 'package:flutter_web/app/domain/usecases/errors/failure_request.dart';
import 'package:flutter_web/app/infra/data/endpoint/end_point_api_ads.dart';

import 'interface/datasource.dart';

class ApiDatasourceImplementation implements Datasource {
  final HttpClient client;

  ApiDatasourceImplementation(this.client);

  @override
  Future<Either<FailureRequest, HttpResponse>> auth(
      Map<String, dynamic> body) async {
    final response =
        await client.post(EndPointApiAds.apod('auth/login'), body: body);

    return _handleResponse(response);
  }

  @override
  Future<Either<FailureRequest, HttpResponse>> registre(
      Map<String, dynamic> body) async {
    final response = await client.post(EndPointApiAds.apod('user'), body: body);

    return _handleResponse(response);
  }
}

Either<FailureRequest, HttpResponse> _handleResponse(HttpResponse response) {
  switch (response.statusCode) {
    case 200:
      return Right(response);
    case 201:
      return Right(response);
    case 400:
      return Left(FailureRepository.badRequest());
    case 404:
      return Left(FailureRepository.notFound());
    case 500:
      return Left(FailureRepository.serverError());
    case 401:
      return Left(FailureRepository.unauthorized());
    case 409:
      return Left(FailureRepository.conflict());
    case 403:
      return Left(FailureRepository.forbidden());
    default:
      return Left(FailureRepository.unknownError());
  }
}
