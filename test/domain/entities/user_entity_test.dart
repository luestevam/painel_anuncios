import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';

import '../../mock/mock_user.dart';

main() {
  group('Entity User', () {
    test('should be create a object of entity user', () {
      final user = UserEntity(
        accessToken: faker.jwt.secret,
        refreshToken: faker.jwt.secret,
        email: faker.internet.email(),
        id: faker.guid.guid(),
      );
      expect(user, isA<UserEntity>());
    });

    test('should return a valid model', () {
      final user = UserEntity(
        accessToken: faker.jwt.secret,
        refreshToken: faker.jwt.secret,
        email: faker.internet.email(),
        id: faker.guid.guid(),
      );
      expect(user.toJson(), {
        'access_token': user.accessToken,
        'refresh_token': user.refreshToken,
        'email': user.email,
        'id': user.id,
      });
    });

    test('should return a valid model when receve map and convert in object', () {
      Map<String, dynamic> user = json.decode(mockUserMapFake);
      final result = UserEntity.fromJson(user);

      expect(result, isA<UserEntity>());
      expect(result.email, 'carlos_cdm@live.com');
    });
  });
}
