import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String email;
  final String? accessToken;
  final String? refreshToken;
  final String? password;
  final String? name;

  UserEntity({
    required this.email,
    this.id,
    this.accessToken,
    this.refreshToken,
    this.password,
    this.name,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['user']['id'],
      email: json['user']['email'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  Map<String, dynamic> toJsonForAuth() {
    return {
      'email': email,
      'password': password,
    };
  }

  Map<String, dynamic> toJsonForRegistry() {
    return {
      'email': email,
      'password': refreshToken,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [
        id,
        email,
        accessToken,
        refreshToken,
      ];

  @override
  String toString() {
    return 'UserEntity{id: $id, email: $email, accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}
