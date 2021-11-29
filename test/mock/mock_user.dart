import 'package:faker/faker.dart';
import 'package:flutter_web/app/domain/entities/user_entity.dart';

const mockUserMapFake = """
{
    "user": {
        "id": "e579ee03-24c8-445b-9622-af25250d94d9",
        "email": "carlos_cdm@live.com"
    },
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNhcmxvc19jZG1AbGl2ZS5jb20iLCJzdWIiOiJlNTc5ZWUwMy0yNGM4LTQ0NWItOTYyMi1hZjI1MjUwZDk0ZDkiLCJpYXQiOjE2MzY1NDk1OTMsImV4cCI6MTYzNjU0OTY1M30.h3zw-OIRY8zMSfQV67Vb0brO5SzZZ45gLuBbSZWRsM4",
    "refresh_token": "53c70e624a67ad4985493155381ad43afbd1982720fb9ee65d2ed422f41c3d4a"
}
""";

final mockUserObjectFake = UserEntity(
  accessToken:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNhcmxvc19jZG1AbGl2ZS5jb20iLCJzdWIiOiJlNTc5ZWUwMy0yNGM4LTQ0NWItOTYyMi1hZjI1MjUwZDk0ZDkiLCJpYXQiOjE2MzY1NDk1OTMsImV4cCI6MTYzNjU0OTY1M30.h3zw-OIRY8zMSfQV67Vb0brO5SzZZ45gLuBbSZWRsM4",
  email: "carlos_cdm@live.com",
  id: "e579ee03-24c8-445b-9622-af25250d94d9",
  refreshToken:
      "53c70e624a67ad4985493155381ad43afbd1982720fb9ee65d2ed422f41c3d4a",
);

final Map<String, dynamic> mockUserMap = {
  "user": {
    "id": faker.guid.guid(),
    "email": faker.internet.email(),
    "password": faker.internet.password(),
  },
};
