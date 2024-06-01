import 'dart:convert';

class SignupModel {
    final String? fullName;
    final String? username;
    final String? country;
    final String? password;
    final String? email;
    final String? deviceName;

    SignupModel({
        this.fullName,
        this.username,
        this.country,
        this.password,
        this.email,
        this.deviceName,
    });

    factory SignupModel.fromRawJson(String str) => SignupModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        fullName: json["full_name"],
        username: json["username"],
        country: json["country"],
        password: json["password"],
        email: json["email"],
        deviceName: json["device_name"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "country": country,
        "password": password,
        "email": email,
        "device_name": deviceName,
    };
}
