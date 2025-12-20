// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) {
  final jsonData = json.decode(str);
  return AuthModel.fromJson(jsonData);
}

String authModelToJson(AuthModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class AuthModel {
  bool? success;
  String? message;
  Data? data;

  AuthModel({
    this.success,
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  User? user;
  String? token;
  String? tokenType;

  Data({
    this.user,
    this.token,
    this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>  Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
    "token_type": tokenType,
  };
}

class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) =>  User(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
