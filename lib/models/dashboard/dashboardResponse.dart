// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) =>
    json.encode(data.toJson());

class DashboardResponse {
  final bool? status;
  final String? message;
  final Data? data;
  final List<dynamic>? meta;
  final List<dynamic>? pagination;

  DashboardResponse({
    this.status,
    this.message,
    this.data,
    this.meta,
    this.pagination,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null
            ? []
            : List<dynamic>.from(json["meta"]!.map((x) => x)),
        pagination: json["pagination"] == null
            ? []
            : List<dynamic>.from(json["pagination"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "pagination": pagination == null
            ? []
            : List<dynamic>.from(pagination!.map((x) => x)),
      };
}

class Data {
  final String? secret;

  Data({
    this.secret,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        secret: json["secret"],
      );

  Map<String, dynamic> toJson() => {
        "secret": secret,
      };
}
