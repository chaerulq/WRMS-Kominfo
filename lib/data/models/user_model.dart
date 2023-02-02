// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.authKey,
    required this.status,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String username;
  String password;
  String email;
  String authKey;
  int status;
  dynamic createdAt;
  dynamic createdBy;
  dynamic updatedAt;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        authKey: json["auth_key"],
        status: json["status"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "auth_key": authKey,
        "status": status,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
