import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/contracts/gateways/http_client.dart';
import 'package:flutter_web/app/domain/usecases/errors/failure_repositoy.dart';

import 'package:flutter_web/app/infra/data/datasource/api_datasource_implementation.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_user.dart';

class MockHttpClient extends Mock implements HttpClient {}

main() {
  late HttpClient httpClient;
  late ApiDatasourceImplementation datasource;

  setUp(() {
    httpClient = MockHttpClient();
    datasource = ApiDatasourceImplementation(httpClient);
  });

  void sucessMock() {
    when(() => httpClient.post(any(), body:mockUserMap)).thenAnswer(
        (_) async =>
            HttpResponse(data: json.decode(mockUserMapFake), statusCode: 200));
  }

  void errorMock(int status) {
    when(() => httpClient.post(any(), body: mockUserMap)).thenAnswer(
        (_) async =>
            HttpResponse(data: 'something went error', statusCode: status));
  }

  group('Data Source Auth', () {
    test('should return a user in formart map', () async {
      sucessMock();
      final user = await datasource.auth(mockUserMap);

      expect(user.isRight, true);
      expect(user.right.data, json.decode(mockUserMapFake));
    });

    test('should return error when status code 400 badRequest', () async {
      errorMock(400);
      final user = await datasource.auth(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.badRequest());
    });

    test('should return error when status code 401 unauthorized', () async {
      errorMock(401);
      final user = await datasource.auth(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.unauthorized());
    });

    test('should return error when status code 404 not found', () async {
      errorMock(404);
      final user = await datasource.auth(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.notFound());
    });

    test('should return error when status code 500 not found', () async {
      errorMock(500);
      final user = await datasource.auth(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.serverError());
    });

    test('should return error when status code 409 conflict Error ', () async {
      errorMock(409);
      final user = await datasource.auth(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.conflict());
    });

    test('should return error when status code 403 forbidden', () async {
      errorMock(403);
      final user = await datasource.auth(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.forbidden());
    });
  });

  group("Data source Registre", () {
    test('should return a user in formart map', () async {
      sucessMock();
      final user = await datasource.registre(mockUserMap);

      expect(user.isRight, true);
      expect(user.right.data, json.decode(mockUserMapFake));
    });

    test('should return error when status code 400 badRequest', () async {
      errorMock(400);
      final user = await datasource.registre(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.badRequest());
    });

    test('should return error when status code 401 unauthorized', () async {
      errorMock(401);
      final user = await datasource.registre(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.unauthorized());
    });

    test('should return error when status code 404 not found', () async {
      errorMock(404);
      final user = await datasource.registre(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.notFound());
    });

    test('should return error when status code 404 server error ', () async {
      errorMock(500);
      final user = await datasource.registre(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.serverError());
    });

    test('should return error when status code 409 conflict Error ', () async {
      errorMock(409);
      final user = await datasource.registre(mockUserMap);

      expect(user.isLeft, true);
      expect(user.left, isA<FailureRepository>());
      expect(user.left, FailureRepository.conflict());
    });
  });
}
