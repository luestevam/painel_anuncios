import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/contracts/gateways/http_client.dart';

import 'package:mocktail/mocktail.dart';

class MockHttpClientGetConnect extends Mock implements HttpClient {}

main() {
  late HttpClient httpClientGetConnect;

  final url = faker.internet.httpUrl();

  sucess() {
    when(() => httpClientGetConnect.get(url)).thenAnswer((_) async =>
        HttpResponse(data: '{"name":"Mocktail"}', statusCode: 200));
  }

  caseOfErros(int statusCode) {
    when(() => httpClientGetConnect.get(url)).thenAnswer(
        (_) async => HttpResponse(data: [], statusCode: statusCode));
  }

  group('HttpClient', () {
    setUp(() {
      httpClientGetConnect = MockHttpClientGetConnect();
    });

    test('should return a type HttpClient', () async {
      expect(httpClientGetConnect, isA<HttpClient>());
    });

    test('should return a statusCode 200 ', () async {
      sucess();
      final response = await httpClientGetConnect.get(url);
      expect(response.statusCode, 200);
    });

    test('should return a statusCode 400 ', () async {
      caseOfErros(400);
      final response = await httpClientGetConnect.get(url);
      expect(response.statusCode, 400);
    });

    test('should return a statusCode 500 ', () async {
      caseOfErros(500);
      final response = await httpClientGetConnect.get(url);
      expect(response.data, []);
      expect(response.statusCode, 500);
    });

    test('should return a statusCode 401 ', () async {
      caseOfErros(401);
      final response = await httpClientGetConnect.get(url);
      expect(response.data, []);
      expect(response.statusCode, 401);
    });
  });
}
