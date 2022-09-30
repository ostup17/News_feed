// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.tokens,
    required this.user,
  });

  Tokens tokens;
  User user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    tokens: Tokens.fromJson(json["tokens"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "tokens": tokens.toJson(),
    "user": user.toJson(),
  };
}

class Tokens {
  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.nickname,
  });

  int id;
  String email;
  String nickname;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    nickname: json["nickname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "nickname": nickname,
  };
}
