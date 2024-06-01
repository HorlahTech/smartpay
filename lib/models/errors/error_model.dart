// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  final bool? status;
  final String? message;
  final List<dynamic>? data;
  final List<dynamic>? meta;
  final Errors? errors;

  ErrorResponse({
    this.status,
    this.message,
    this.data,
    this.meta,
    this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
        meta: json["meta"] == null
            ? []
            : List<dynamic>.from(json["meta"]!.map((x) => x)),
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "errors": errors?.toJson(),
      };
}

class Errors {
  final List<String>? email;
  final List<String>? password;
  final List<String>? country;

  Errors({
    this.email,
    this.password,
    this.country,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null
            ? []
            : List<String>.from(json["email"]!.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<String>.from(json["password"]!.map((x) => x)),
        country: json["country"] == null
            ? []
            : List<String>.from(json["country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
        "password":
            password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
        "country":
            country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
      };
}
